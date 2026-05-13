import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.teal,
        primary: AppColors.teal,
        secondary: AppColors.navy,
        background: AppColors.lightGrey,
        surface: AppColors.white,
        error: AppColors.error,
        onPrimary: AppColors.white,
        onSecondary: AppColors.white,
      ),
      cardTheme: CardTheme(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        elevation: 2,
        color: AppColors.white,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.teal,
        foregroundColor: AppColors.white,
        elevation: 0,
        centerTitle: true,
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.teal,
        brightness: Brightness.dark,
        primary: AppColors.teal,
        secondary: AppColors.navy,
        error: AppColors.error,
      ),
      cardTheme: CardTheme(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        elevation: 2,
      ),
    );
  }
}
