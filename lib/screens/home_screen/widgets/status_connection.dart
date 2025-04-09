import 'package:expance_tracker/controllers/home_controller.dart';
import 'package:expance_tracker/services/vpn_engine.dart';
import 'package:expance_tracker/theme/theme.dart';
import 'package:flutter/material.dart';

class StatusConnectionWidget extends StatelessWidget {
  const StatusConnectionWidget({
    super.key,
    required this.screenSize,
    required this.controller,
  });
  final Size screenSize;
  final HomeController controller;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      height: 50,
      width: screenSize.width / 2,
      decoration: BoxDecoration(
        color: Color(0xFFFF5C00),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            controller.vpnState.value == VpnEngine.vpnDisconnected
                ? 'Not Secured 🛡️'
                : controller.getButtonText,
            style: theme.textTheme.bodyMedium
                ?.copyWith(color: theme.statusConnectionTextColor),
          ),
        ],
      ),
    );
  }
}
