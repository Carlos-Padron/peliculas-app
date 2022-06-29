import 'package:flutter/material.dart';

class AppTheme {
  static const Color primaryColor = Color(0xFFaabbcc);

  static ThemeData lightTheme = ThemeData.light().copyWith(
    primaryColor: primaryColor,
    appBarTheme: const AppBarTheme(
      color: primaryColor,
      elevation: 0,
    ),
  );
}
