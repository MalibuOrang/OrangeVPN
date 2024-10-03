import 'dart:math';

import 'package:country_flags/country_flags.dart';
import 'package:expance_tracker/controllers/home_controller.dart';
import 'package:expance_tracker/helpers/my_dialogs.dart';
import 'package:expance_tracker/helpers/pref.dart';
import 'package:expance_tracker/main.dart';
import 'package:expance_tracker/models/vpn.dart';
import 'package:expance_tracker/services/vpn_engine.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VpnCardWidget extends StatelessWidget {
  final Vpn vpn;
  const VpnCardWidget({super.key, required this.vpn});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();
    return Card(
      margin: EdgeInsets.symmetric(
        vertical: screenSize.height * 0.01,
      ),
      elevation: 10,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      child: InkWell(
        onTap: () {
          controller.selectedVpn.value = vpn;
          Pref.vpn = vpn;
          Get.back();
          MyDialogs.success(msg: 'Connecting VPN Location...');
          if (controller.vpnState.value == VpnEngine.vpnConnected) {
            VpnEngine.stopVpn();
            Future.delayed(Duration(seconds: 2), () {
              controller.connectToVpn();
            });
          } else {
            controller.connectToVpn();
          }
        },
        borderRadius: BorderRadius.circular(15),
        child: ListTile(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          leading: CountryFlag.fromCountryCode(
            vpn.countryShort,
            shape: const RoundedRectangle(10),
            height: 40,
            width: screenSize.width * 0.15,
          ),
          title: Text(vpn.countryLong),
          subtitle: Row(
            children: [
              Icon(
                Icons.speed_rounded,
                color: Colors.blue,
                size: 20,
              ),
              SizedBox(
                width: 4,
              ),
              Text(
                _formatBytes(vpn.speed, 1),
                style: TextStyle(
                  fontSize: 13,
                ),
              ),
            ],
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                CupertinoIcons.person_2,
                color: Colors.blue,
                size: 20,
              ),
              SizedBox(
                width: 4,
              ),
              Text(
                vpn.numVpnSessions.toString(),
                style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: Theme.of(context).lightText),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _formatBytes(int bytes, int decimals) {
    if (bytes <= 0) return "0 B";
    const suffixes = ["Bps", "Kbps", "Mbps", "Gbps", "Tbps"];
    var i = (log(bytes) / log(1024)).floor();
    return '${(bytes / pow(1024, i)).toStringAsFixed(decimals)} ${suffixes[i]}';
  }
}
