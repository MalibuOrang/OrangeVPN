import 'package:expance_tracker/controllers/location_controller.dart';
import 'package:expance_tracker/main.dart';
import 'package:expance_tracker/widgets/vpn_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class LocationScreen extends StatelessWidget {
  LocationScreen({super.key});
  final _controller = LocationController();
  @override
  Widget build(BuildContext context) {
    if (_controller.listVpn.isEmpty) {
      _controller.getVpnData();
    }
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          title: Text(
            'VPN Locations: ${_controller.listVpn.length}',
            style: TextStyle(fontSize: 16),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blue,
          onPressed: () {
            _controller.getVpnData();
          },
          child: Icon(
            CupertinoIcons.refresh,
            color: Colors.white,
          ),
        ),
        body: _controller.isLoading.value
            ? _loadingWidget()
            : _controller.listVpn.isEmpty
                ? _noVPNFound()
                : _vpnData(),
      ),
    );
  }

  _vpnData() => ListView.builder(
        itemCount: _controller.listVpn.length,
        padding: EdgeInsets.only(
          top: screenSize.height * 0.01,
          bottom: screenSize.height * 0.10,
          left: screenSize.width * 0.04,
          right: screenSize.width * 0.04,
        ),
        itemBuilder: (context, index) {
          return VpnCardWidget(
            vpn: _controller.listVpn[index],
          );
        },
      );

  _loadingWidget() => SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LottieBuilder.asset(
              'assets/animations/blueCircle.json',
              width: screenSize.width * 0.7,
            ),
            Text(
              'Loading VPNs...📡',
              style: TextStyle(
                fontSize: 18,
                color: Colors.black54,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      );

  _noVPNFound() => Center(
        child: Text(
          'No VPNs list! 🛠️',
          style: TextStyle(
            fontSize: 18,
            color: Colors.black54,
            fontWeight: FontWeight.bold,
          ),
        ),
      );
}
