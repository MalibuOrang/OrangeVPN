import 'dart:convert';
import 'dart:developer';
import 'package:csv/csv.dart';
import 'package:expance_tracker/helpers/my_dialogs.dart';
import 'package:expance_tracker/helpers/pref.dart';
import 'package:expance_tracker/models/ip_details.dart';
import 'package:expance_tracker/models/vpn.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';

class APIs {
  static Future<List<Vpn>> getVpnServers() async {
    final List<Vpn> vpnList = [];
    try {
      final result = await get(Uri.parse('http://www.vpngate.net/api/iphone/'));
      final scvString = result.body.split("#")[1].replaceAll('*', '');
      List<List<dynamic>> listVpn =
          const CsvToListConverter().convert(scvString);
      final header = listVpn[0];
      for (int i = 1; i < listVpn.length - 1; ++i) {
        Map<String, dynamic> tempJson = {};
        for (int j = 0; j < header.length; ++j)
          tempJson.addAll({header[j].toString(): listVpn[i][j]});
        vpnList.add(Vpn.fromJson(tempJson));
      }
    } catch (e) {
      MyDialogs.error(msg: e.toString());
      log('\ngetVPNServers failed: $e');
    }
    vpnList.shuffle();
    if (vpnList.isNotEmpty) {
      Pref.vpnList = vpnList;
    }
    return vpnList;
  }

  static Future<void> getIPDetails({required Rx<IpDetails> ipData}) async {
    try {
      final result = await get(Uri.parse('http://ip-api.com/json/'));
      final data = jsonDecode(result.body);
      log(data.toString());
      ipData.value = IpDetails.fromJson(data);
    } catch (e) {
      MyDialogs.error(msg: e.toString());
      log('\ngetVPNServers failed: $e');
    }
  }
}
