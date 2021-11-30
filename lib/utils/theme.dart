import 'package:flutter/material.dart';

class AppTheme {
  static const primaryColor = Color(0xfffdd100);

  static final textButton = TextButtonThemeData(
      style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all(Colors.white),
          backgroundColor: MaterialStateProperty.all(primaryColor)));

  static final lightTheme = ThemeData(
      primaryColor: primaryColor,
      brightness: Brightness.light,
      textButtonTheme: textButton,
      appBarTheme: const AppBarTheme(backgroundColor: primaryColor));
}
