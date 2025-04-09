import 'package:expance_tracker/generated/l10n.dart';
import 'package:flutter/material.dart';

class InfoAppSplash extends StatelessWidget {
  const InfoAppSplash({
    super.key,
    required this.screenSize,
    this.theme,
  });
  final Size screenSize;
  final ThemeData? theme;
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: screenSize.height * 0.15,
      width: screenSize.width,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Text(
          S.of(context).orangeVpnSplashMessage,
          textAlign: TextAlign.center,
          style: theme?.textTheme.bodyMedium,
        ),
      ),
    );
  }
}
