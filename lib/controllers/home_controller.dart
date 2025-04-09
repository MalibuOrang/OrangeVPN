import 'dart:convert';
import 'package:expance_tracker/generated/l10n.dart';
import 'package:expance_tracker/helpers/my_dialogs.dart';
import 'package:expance_tracker/helpers/pref.dart';
import 'package:expance_tracker/models/vpn.dart';
import 'package:expance_tracker/models/vpn_config.dart';
import 'package:expance_tracker/services/vpn_engine.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final Rx<Vpn> selectedVpn = Pref.vpn.obs;
  final vpnState = VpnEngine.vpnDisconnected.obs;

  void connectToVpn(BuildContext context) {
    if (selectedVpn.value.openVpnConfigDataBase64.isEmpty)
      MyDialogs.info(
        msg: S.of(context).selectLocationTabChangeLocation,
      );
    if (vpnState.value == VpnEngine.vpnDisconnected) {
      final data =
          Base64Decoder().convert(selectedVpn.value.openVpnConfigDataBase64);
      final config = Utf8Decoder().convert(data);
      final vpnConfig = VpnConfig(
          country: selectedVpn.value.countryLong,
          username: 'vpn',
          password: 'vpn',
          config: config);

      ///Start if stage is disconnected
      VpnEngine.startVpn(vpnConfig);
    } else {
      ///Stop if stage is "not" disconnected
      VpnEngine.stopVpn();
    }
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
