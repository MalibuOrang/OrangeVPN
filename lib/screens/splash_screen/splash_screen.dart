import 'package:flutter/material.dart';
import '../../widgets/app_background.dart';
import 'widgets/widget.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final theme = Theme.of(context);
    return Scaffold(
      body: AppBackground(
        child: Stack(
          children: [
            WelcomeSplash(
              screenSize: screenSize,
              theme: theme,
            ),
            InfoAppSplash(
              screenSize: screenSize,
              theme: theme,
            ),
            GetStartedSplash(
              screenSize: screenSize,
              theme: theme,
            ),
          ],
        ),
      ),
    );
  }
}
