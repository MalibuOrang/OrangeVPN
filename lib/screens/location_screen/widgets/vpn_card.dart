import 'dart:math';
import 'package:country_flags/country_flags.dart';
import 'package:expance_tracker/controllers/home_controller.dart';
import 'package:expance_tracker/generated/l10n.dart';
import 'package:expance_tracker/helpers/my_dialogs.dart';
import 'package:expance_tracker/helpers/pref.dart';
import 'package:expance_tracker/models/vpn.dart';
import 'package:expance_tracker/services/vpn_engine.dart';
import 'package:expance_tracker/theme/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VpnCardWidget extends StatelessWidget {
  final Vpn vpn;
  final Size screenSize;
  const VpnCardWidget({
    super.key,
    required this.vpn,
    required this.screenSize,
  });

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
          MyDialogs.success(msg: S.of(context).connectingVpnLocation);
          if (controller.vpnState.value == VpnEngine.vpnConnected) {
            VpnEngine.stopVpn();
            Future.delayed(Duration(seconds: 2), () {
              controller.connectToVpn(context);
            });
          } else {
            controller.connectToVpn(context);
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
          title: Text(
            vpn.countryLong,
            style: TextStyle(fontSize: 16),
          ),
          subtitle: Row(
            children: [
              Icon(
                Icons.speed_rounded,
                color: Color(0xFFFF5C00),
                size: 20,
              ),
              SizedBox(
                width: 4,
              ),
              Text(
                _formatBytes(vpn.speed, 1, context),
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
            ],
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                CupertinoIcons.person_2,
                color: Color(0xFFFF5C00),
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
                  color: Theme.of(context).colorText,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _formatBytes(int bytes, int decimals, BuildContext context) {
    if (bytes <= 0) return S.of(context).baseBite;
    List<String> suffixes = [
      S.of(context).bps,
      S.of(context).kbps,
      S.of(context).mbps,
      S.of(context).gbps,
      S.of(context).tbps
    ];
    var i = (log(bytes) / log(1024)).floor();
    return '${(bytes / pow(1024, i)).toStringAsFixed(decimals)} ${suffixes[i]}';
  }
}
