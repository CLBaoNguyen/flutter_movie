import 'package:flutter/material.dart';

abstract final class AppColors {
  static const black1 = Color(0xFF101010);
  static const white1 = Color(0xFFFFF7FA);
  static const grey1 = Color(0xFFF2F2F2);
  static const grey2 = Color(0xFF4D4D4D);
  static const grey3 = Color(0xFFA4A4A4);
  static const grey40 = Color(0xFF625b71);

  static const lightColorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: Colors.amberAccent,
    onPrimary: Colors.black,
    secondary: grey40,
    onSecondary: AppColors.white1,
    surface: Colors.black,
    onSurface: Colors.white,
    error: Colors.white,
    onError: Colors.red,
  );
}