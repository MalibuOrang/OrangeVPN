import 'package:expance_tracker/helpers/config.dart';
import 'package:expance_tracker/helpers/pref.dart';
import 'package:expance_tracker/screens/splash_screen/splash_screen.dart';
import 'package:expance_tracker/theme/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await Config.initConfig();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
  await Pref.initializeHive();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((value) {
    runApp(const OrangeVpnApp());
  });
}

class OrangeVpnApp extends StatelessWidget {
  const OrangeVpnApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'OrangeVPN',
      home: SplashScreen(),
      theme: AppThemes.lightTheme,
      themeMode: AppThemes.themeMode,
      darkTheme: AppThemes.darkTheme,
      debugShowCheckedModeBanner: false,
    );
  }
}
