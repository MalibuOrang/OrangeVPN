import 'package:expance_tracker/controllers/location_controller.dart';
import 'package:expance_tracker/widgets/app_background.dart';
import 'package:expance_tracker/screens/location_screen/widgets/vpn_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class LocationScreen extends StatelessWidget {
  LocationScreen({super.key});
  final _controller = LocationController();
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    if (_controller.listVpn.isEmpty) {
      _controller.getVpnData();
    }
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          title: Text(
            'VPN Locations: ${_controller.listVpn.length}',
            style: TextStyle(fontSize: 20),
          ),
        ),
        body: _controller.isLoading.value
            ? _loadingWidget(screenSize)
            : _controller.listVpn.isEmpty
                ? _noVPNFound(screenSize)
                : _vpnData(screenSize),
      ),
    );
  }

  _vpnData(final Size screenSize) => AppBackground(
        child: Stack(
          children: [
            RefreshIndicator(
              color: Colors.orange,
              onRefresh: () async => _controller.getVpnData(),
              child: ListView.builder(
                itemCount: _controller.listVpn.length,
                padding: EdgeInsets.only(
                  top: screenSize.height * 0.01,
                  bottom: screenSize.height * 0.10,
                  left: screenSize.width * 0.04,
                  right: screenSize.width * 0.04,
                ),
                itemBuilder: (context, index) {
                  return VpnCardWidget(
                    screenSize: screenSize,
                    vpn: _controller.listVpn[index],
                  );
                },
              ),
            ),
          ],
        ),
      );

  _loadingWidget(final Size screenSize) => AppBackground(
        child: Stack(
          children: [
            SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  LottieBuilder.asset(
                    'assets/animations/servers_loading.json',
                    width: screenSize.width * 0.7,
                  ),
                ],
              ),
            ),
          ],
        ),
      );

  _noVPNFound(final Size screenSize) => AppBackground(
        child: Stack(
          children: [
            SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  LottieBuilder.asset(
                    'assets/animations/no_data.json',
                    width: screenSize.width * 0.7,
                  ),
                ],
              ),
            ),
          ],
        ),
      );
}
