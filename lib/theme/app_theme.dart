import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

class AppTheme {
  static ThemeData get theme {
    return ThemeData(
      primaryColor: AppColors.primary,
      scaffoldBackgroundColor: AppColors.background,
      textTheme: TextTheme(
        headlineLarge: GoogleFonts.playfairDisplay(
          fontSize: 32,
          fontWeight: FontWeight.bold,
          color: AppColors.primary,
        ),
        bodyLarge: GoogleFonts.workSans(fontSize: 16, color: AppColors.text),
      ),
      appBarTheme: const AppBarTheme(backgroundColor: AppColors.primary, foregroundColor: Colors.white),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.accent,
          foregroundColor: Colors.black,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
        ).copyWith(overlayColor: MaterialStateProperty.all(AppColors.danger)),
      ),
    );
  }
}
