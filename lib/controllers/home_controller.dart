import 'dart:convert';
import 'dart:math';
import 'package:expance_tracker/controllers/location_controller.dart';
import 'package:expance_tracker/generated/l10n.dart';
import 'package:expance_tracker/helpers/pref.dart';
import 'package:expance_tracker/models/vpn.dart';
import 'package:expance_tracker/models/vpn_config.dart';
import 'package:expance_tracker/services/vpn_engine.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

class HomeController extends GetxController {
  final Rx<Vpn> selectedVpn = Pref.vpn.obs;
  final logger = Logger();
  final vpnState = VpnEngine.vpnDisconnected.obs;
  final RxBool isAuto = true.obs;
  final controller = LocationController();

  @override
  void onInit() {
    controller.getVpnData();
    super.onInit();
  }

  void connectToVpn(BuildContext context) {
    try {
      if (controller.listVpn.isEmpty) {
        logger.w("VPN list is empty. Cannot connect.");
        return;
      }
      if (isAuto.value == true && vpnState.value == VpnEngine.vpnDisconnected) {
        connectAutoVpn();
      }
      if (vpnState.value == VpnEngine.vpnDisconnected) {
        final VpnConfig vpnConfig = configurateVpnData(
            selectedVpn.value.openVpnConfigDataBase64,
            selectedVpn.value.countryLong);
        // Start if stage is disconnected
        VpnEngine.startVpn(vpnConfig);
      } else {
        // Stop if stage is "not" disconnected
        VpnEngine.stopVpn();
      }
    } catch (e) {
      logger.e(e);
      VpnEngine.stopVpn();
    }
  }

  void connectAutoVpn() {
    try {
      final Vpn randomVpn =
          controller.listVpn[Random().nextInt(controller.listVpn.length)];
      selectedVpn.value = randomVpn;
      final VpnConfig vpnConfig = configurateVpnData(
          selectedVpn.value.openVpnConfigDataBase64,
          selectedVpn.value.countryLong);
      // Start if stage is disconnected
      VpnEngine.startVpn(vpnConfig);
    } catch (e) {
      logger.e(e);
      VpnEngine.stopVpn();
    }
  }

  VpnConfig configurateVpnData(String configBase64, String countryLong) {
    final data = Base64Decoder().convert(configBase64);
    final config = Utf8Decoder().convert(data);
    final vpnConfig = VpnConfig(
      country: countryLong,
      username: 'vpn',
      password: 'vpn',
      config: config,
    );
    return vpnConfig;
  }

  Color get getButtonColor {
    switch (vpnState.value) {
      case VpnEngine.vpnDisconnected:
        return Color(0xFFFF5C00);
      case VpnEngine.vpnConnected:
        return Colors.green;
      default:
        return Color(0xFFFF5C00);
    }
  }

  String getButtonText(BuildContext context) {
    switch (vpnState.value) {
      case VpnEngine.vpnDisconnected:
        return S.of(context).disconnected;
      case VpnEngine.vpnConnected:
        return S.of(context).secured;
      default:
        return S.of(context).connecting;
    }
  }
}
