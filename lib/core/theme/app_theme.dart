import 'package:fb_fitbody/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: AppColors.white,
    primaryColor: AppColors.cyan,
    brightness: Brightness.light,
    colorScheme: const ColorScheme.light(surface: AppColors.cyan50),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.black,
        foregroundColor: Colors.white, // Text color
      ),
    ),
  );
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: AppColors.black,
    primaryColor: AppColors.cyan,
    brightness: Brightness.dark,
    colorScheme: const ColorScheme.dark(surface: AppColors.darkCyan50),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.cyan,
        foregroundColor: Colors.white, // Text color
      ),
    ),
  );
}
