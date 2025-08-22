import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

class AppTextStyles {
  static final TextStyle title = GoogleFonts.poppins(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: AppColors.primary,
  );

  static final TextStyle subtitle = GoogleFonts.poppins(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: AppColors.primary,
  );

  static final TextStyle body = GoogleFonts.workSans(fontSize: 16, color: AppColors.text);

  static final TextStyle button = GoogleFonts.workSans(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: Colors.black,
  );
}
