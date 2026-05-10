import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      fontFamily: 'Poppins',
      
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.primary,
        primary: AppColors.primary,
        secondary: AppColors.secondary,
        tertiary: AppColors.accent,
        surface: AppColors.white,
      ),
      scaffoldBackgroundColor: AppColors.background,

      // Styling AppBar
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.white,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: TextStyle(
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w600,
          fontSize: 18,
        ),
      ),

      // Custom TextTheme
      textTheme: const TextTheme(
        displayLarge: TextStyle(
          color: AppColors.textPrimary,
          fontWeight: FontWeight.bold, // Poppins Bold
        ),
        bodyLarge: TextStyle(
          color: AppColors.textPrimary,
          fontWeight: FontWeight.w500, // Poppins Medium
        ),
        bodyMedium: TextStyle(
          color: AppColors.textSecondary,
          fontWeight: FontWeight.w400, // Poppins Regular
        ),
      ),
    );
  }
}
