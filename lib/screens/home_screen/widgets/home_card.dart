import 'package:expance_tracker/theme/theme.dart';
import 'package:flutter/material.dart';

class HomeCardWidget extends StatelessWidget {
  final String title, subtitle;
  final Widget icon;
  final Size screenSize;
  const HomeCardWidget({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.screenSize,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SizedBox(
      width: screenSize.width * 0.45,
      child: Column(
        children: [
          icon,
          SizedBox(
            height: 6,
          ),
          Text(
            title,
            style: theme.textTheme.bodyMedium?.copyWith(
              fontSize: 16,
              color: theme.vpnInfoTitleColor,
            ),
          ),
          Text(
            subtitle,
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.vpnInfoTitleColor,
            ),
          ),
        ],
      ),
    );
  }
}
