import 'package:expance_tracker/screens/home_screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class GetStartedSplash extends StatelessWidget {
  const GetStartedSplash({
    super.key,
    required this.screenSize,
    this.theme,
  });
  final Size screenSize;
  final ThemeData? theme;
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: screenSize.height * 0.07,
      width: screenSize.width - 40,
      height: 56,
      left: 20,
      child: ElevatedButton(
        style: theme?.elevatedButtonTheme.style,
        child: Text(
          "Get Started",
          style: theme?.textTheme.bodyMedium?.copyWith(
            fontSize: 16,
          ),
        ),
        onPressed: () {
          SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
          Get.off(() => HomeScreen());
        },
      ),
    );
  }
}
