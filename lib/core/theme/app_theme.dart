import 'package:fb_fitbody/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: AppColors.white,
    primaryColor: AppColors.cyan,
    brightness: Brightness.light,
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: AppColors.cyan,
      selectionColor: AppColors.cyan,
      selectionHandleColor: AppColors.cyan,
    ),
    colorScheme: const ColorScheme.light(
      onPrimary: AppColors.black,
      surface: AppColors.cyan50,
      onSecondary: AppColors.black,
      onTertiary: AppColors.lightGrey50,
      primaryFixed: AppColors.white,
      outline: AppColors.lightGrey150,
    ),
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
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: AppColors.cyan,
      selectionColor: AppColors.cyan,
      selectionHandleColor: AppColors.cyan,
    ),
    colorScheme: const ColorScheme.dark(
      onPrimary: AppColors.cyan,
      onSecondary: AppColors.white,
      onTertiary: AppColors.darkGrey50,
      surface: AppColors.darkCyan50,
      primaryFixed: AppColors.black,
      outline: AppColors.darkGrey150,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.cyan,
        foregroundColor: Colors.white, // Text color
      ),
    ),
  );
}
