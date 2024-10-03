import 'dart:convert';
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

  void connectToVpn() {
    if (selectedVpn.value.openVpnConfigDataBase64.isEmpty)
      MyDialogs.info(msg: 'Select a Location, tab `Change Location`');
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
        return Colors.blue;
      case VpnEngine.vpnConnected:
        return Colors.green;
      default:
        return Colors.orangeAccent;
    }
  }

  String get getButtonText {
    switch (vpnState.value) {
      case VpnEngine.vpnDisconnected:
        return 'Connect VPN';
      case VpnEngine.vpnConnected:
        return 'Disconnect';
      default:
        return 'Connecting...';
    }
  }
}
