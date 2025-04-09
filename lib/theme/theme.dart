import 'package:expance_tracker/helpers/pref.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppThemes {
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      centerTitle: true,
      elevation: 0,
      iconTheme: IconThemeData(
        color: Colors.black,
      ),
      titleTextStyle: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
    ),
    textTheme: TextTheme(
      bodyLarge: GoogleFonts.montserrat(
        color: Color(0xFFFF5C00),
        fontSize: 24,
      ),
      bodyMedium: GoogleFonts.montserrat(
        color: Colors.black,
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
      bodySmall: GoogleFonts.montserrat(
        color: Colors.black,
        fontSize: 12,
        fontWeight: FontWeight.w400,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xFFFF5C00),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    ),
  );
  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      centerTitle: true,
      elevation: 0,
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
    ),
    textTheme: TextTheme(
      bodyLarge: GoogleFonts.montserrat(
        color: Color(0xFFFF5C00),
        fontSize: 24,
      ),
      bodyMedium: GoogleFonts.montserrat(
        color: Colors.white,
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
      bodySmall: GoogleFonts.montserrat(
        color: Colors.white,
        fontSize: 12,
        fontWeight: FontWeight.w400,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xFFFF5C00),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    ),
  );
  static ThemeMode get themeMode =>
      Pref.isDarkMode ? ThemeMode.dark : ThemeMode.light;
}

extension AppTheme on ThemeData {
  Color get colorText => Pref.isDarkMode ? Colors.white : Colors.black;
  Color get actionContainerColor =>
      Pref.isDarkMode ? Colors.white10 : Colors.black.withValues(alpha: 0.1);
  Color get actionIconColor => Pref.isDarkMode ? Colors.white : Colors.black;
  Color get titleAppBarColor => Pref.isDarkMode ? Colors.white : Colors.black;
  Color get infoButtonIconColor =>
      Pref.isDarkMode ? Colors.white : Colors.black;
  Color get statusConnectionTextColor =>
      Pref.isDarkMode ? Colors.white : Colors.black;
  Color get borderVpnButton => Pref.isDarkMode ? Colors.white : Colors.black;
  Color get vpnInfoTitleColor => Pref.isDarkMode ? Colors.white : Colors.black;
}
