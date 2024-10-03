import 'dart:convert';

import 'package:expance_tracker/models/vpn.dart';
import 'package:hive_flutter/hive_flutter.dart';

class Pref {
  static late Box _boxVpn;
  static Future<void> initializeHive() async {
    await Hive.initFlutter();
    _boxVpn = await Hive.openBox('VpnConfigBox');
  }

  static bool get isDarkMode => _boxVpn.get('isDarkMode') ?? false;
  static set isDarkMode(bool appTheme) => _boxVpn.put('isDarkMode', appTheme);

  static Vpn get vpn => Vpn.fromJson(jsonDecode(_boxVpn.get('vpn') ?? '{}'));
  static set vpn(Vpn vpn) => _boxVpn.put('vpn', jsonEncode(vpn));

  static List<Vpn> get vpnList {
    List<Vpn> configsVpn = [];
    final data = jsonDecode(_boxVpn.get('vpnList') ?? '[]');
    for (var i in data) configsVpn.add(Vpn.fromJson(i));
    return configsVpn;
  }

  static set vpnList(List<Vpn> listConfig) =>
      _boxVpn.put('vpnList', jsonEncode(listConfig));
}
