import 'package:expance_tracker/controllers/location_controller.dart';
import 'package:expance_tracker/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'widgets/widget.dart';

class LocationScreen extends StatelessWidget {
  LocationScreen({super.key});
  final _controller = LocationController();
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final int vpnCount = _controller.listVpn.length;
    if (_controller.listVpn.isEmpty) {
      _controller.getVpnData();
    }
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          title: Text(
            S.of(context).vpnCount(vpnCount),
            style: TextStyle(fontSize: 20),
          ),
        ),
        body: _controller.isLoading.value
            ? LoaderAnimation(
                screenSize: screenSize,
              )
            : _controller.listVpn.isEmpty
                ? NoDataAnimation(
                    screenSize: screenSize,
                  )
                : VpnListView(
                    screenSize: screenSize,
                    controller: _controller,
                  ),
      ),
    );
  }
}
