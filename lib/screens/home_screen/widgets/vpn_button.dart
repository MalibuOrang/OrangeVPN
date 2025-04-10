import 'package:expance_tracker/controllers/home_controller.dart';
import 'package:expance_tracker/services/vpn_engine.dart';
import 'package:expance_tracker/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'widget.dart';

Widget vpnButton(final HomeController _controller, final Size screenSize,
    BuildContext context) {
  return Column(
    children: [
      SizedBox(
        height: 10,
      ),
      StatusConnectionWidget(
        screenSize: screenSize,
        controller: _controller,
      ),
      SizedBox(
        height: 10,
      ),
      Stack(
        alignment: Alignment.center,
        children: [
          _controller.vpnState.value == VpnEngine.vpnDisconnected
              ? SizedBox(
                  width: screenSize.height * 0.30,
                  height: screenSize.height * 0.30,
                )
              : SizedBox(
                  width: screenSize.height * 0.30,
                  height: screenSize.height * 0.30,
                  child: LoadingIndicator(
                    indicatorType: Indicator.ballScaleMultiple,
                    colors: _controller.vpnState.value == VpnEngine.vpnConnected
                        ? [
                            Colors.green,
                            Colors.greenAccent,
                          ]
                        : [
                            Colors.orange,
                            Colors.orangeAccent,
                          ],
                    backgroundColor: Colors.transparent,
                  ),
                ),
          _controller.vpnState.value == VpnEngine.vpnConnected
              ? TweenAnimationBuilder<double>(
                  tween: Tween(begin: 0.0, end: 1.0),
                  duration: const Duration(seconds: 2),
                  curve: Curves.easeOut,
                  builder: (context, value, child) {
                    return SizedBox(
                      width: screenSize.height * 0.20,
                      height: screenSize.height * 0.20,
                      child: CircularProgressIndicator(
                        value: value,
                        strokeWidth: 10,
                        valueColor: AlwaysStoppedAnimation<Color>(
                          Theme.of(context).borderVpnButton,
                        ),
                        backgroundColor: Colors.transparent,
                      ),
                    );
                  },
                )
              : SizedBox(
                  width: screenSize.height * 0.20,
                  height: screenSize.height * 0.20,
                ),
          InkWell(
            borderRadius: BorderRadius.circular(100),
            onTap: () {
              _controller.connectToVpn(context);
            },
            child: Container(
              width: screenSize.height * 0.20,
              height: screenSize.height * 0.20,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _controller.getButtonColor,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.power_settings_new_rounded,
                    size: 70,
                    color: Colors.black,
                  ),
                  _controller.vpnState.value == VpnEngine.vpnConnected
                      ? Obx(
                          () => CountDownTimerWidget(
                            startTimer: _controller.vpnState.value ==
                                VpnEngine.vpnConnected,
                          ),
                        )
                      : Container(),
                ],
              ),
            ),
          ),
        ],
      ),
    ],
  );
}
