import 'package:expance_tracker/main.dart';
import 'package:expance_tracker/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/route_manager.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      Duration(seconds: 2),
      () {
        SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
        Get.off(() => HomeScreen());
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            left: screenSize.width * 0.35,
            top: screenSize.height * 0.2,
            child: Image.asset(
              width: screenSize.width * 0.3,
              'assets/images/logo.png',
            ),
          ),
          Positioned(
            bottom: screenSize.height * 0.15,
            width: screenSize.width,
            child: Text(
              'Create by @MrOrange🧡',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.orange,
                letterSpacing: 1,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
