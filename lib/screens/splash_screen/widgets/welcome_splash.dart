import 'package:flutter/material.dart';

class WelcomeSplash extends StatelessWidget {
  const WelcomeSplash({
    super.key,
    required this.screenSize,
    this.theme,
  });
  final Size screenSize;
  final ThemeData? theme;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: screenSize.height * 0.27,
      width: screenSize.width,
      child: Text(
        'Welcome to OrangeVPN',
        textAlign: TextAlign.center,
        style: theme?.textTheme.bodyLarge,
      ),
    );
  }
}
