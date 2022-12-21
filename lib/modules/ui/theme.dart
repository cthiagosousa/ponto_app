import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  static const Color primary = Color(0XFF003994);
  static const Color secondary = Color(0XFF529efa);
  static const Color black = Color(0XFF626362);
}

final theme = ThemeData(
  colorScheme: const ColorScheme.light(
    primary: AppColors.primary,
    secondary: AppColors.secondary,
    background: Colors.white,
  ),
  iconTheme: IconThemeData(
    color: Colors.indigo,
    size: 18.sp,
  ),
  textTheme: GoogleFonts.ubuntuTextTheme(TextTheme(
    bodySmall: TextStyle(
      fontSize: 11.sp,
      color: AppColors.black,
      fontWeight: FontWeight.w300,
    ),
    bodyMedium: TextStyle(
      fontSize: 12.sp,
      color: AppColors.black,
      fontWeight: FontWeight.w400,
    ),
    titleSmall: TextStyle(
      fontSize: 13.sp,
      color: AppColors.black,
      fontWeight: FontWeight.w600,
    ),
    titleMedium: TextStyle(
      fontSize: 16.sp,
      color: AppColors.black,
      fontWeight: FontWeight.w600,
    ),
    titleLarge: TextStyle(
      fontSize: 22.sp,
      color: AppColors.black,
      fontWeight: FontWeight.w700,
    ),
  )),
);