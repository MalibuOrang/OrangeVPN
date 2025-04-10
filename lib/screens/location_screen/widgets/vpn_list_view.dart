import 'package:expance_tracker/controllers/location_controller.dart';
import 'package:expance_tracker/widgets/widget.dart';
import 'package:flutter/material.dart';

import 'widget.dart';

class VpnListView extends StatelessWidget {
  const VpnListView({
    super.key,
    required this.screenSize,
    required this.controller,
  });
  final Size screenSize;
  final LocationController controller;
  @override
  Widget build(BuildContext context) {
    return AppBackground(
      child: Stack(
        children: [
          RefreshIndicator(
            color: Colors.orange,
            onRefresh: () async => controller.getVpnData(),
            child: ListView.builder(
              itemCount: controller.listVpn.length,
              padding: EdgeInsets.only(
                top: screenSize.height * 0.01,
                bottom: screenSize.height * 0.10,
                left: screenSize.width * 0.04,
                right: screenSize.width * 0.04,
              ),
              itemBuilder: (context, index) {
                return VpnCardWidget(
                  screenSize: screenSize,
                  vpn: controller.listVpn[index],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
