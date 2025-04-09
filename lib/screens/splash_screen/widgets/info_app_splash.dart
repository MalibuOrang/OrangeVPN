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
      bottom: screenSize.height * 0.18,
      width: screenSize.width,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Text(
          'Orange VPN is the fastest VPN in the world that provides you with more than 94 servers in countries all over the world.',
          textAlign: TextAlign.center,
          style: theme?.textTheme.bodyMedium,
        ),
      ),
    );
  }
}
