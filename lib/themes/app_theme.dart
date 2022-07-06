import 'package:flutter/material.dart';

class AppTheme {
  static const Color primaryColor = Color(0xFF001f68);

  static ThemeData lightTheme = ThemeData.light().copyWith(
    primaryColor: primaryColor,
    appBarTheme: const AppBarTheme(
      color: primaryColor,
      elevation: 0,
    ),
  );
}
