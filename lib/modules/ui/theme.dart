import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

final theme = ThemeData(
  colorScheme: const ColorScheme.light(
    primary: Colors.indigo,
    secondary: Colors.indigoAccent,
    background: Colors.white,
  ),
  iconTheme: IconThemeData(
    color: Colors.indigo,
    size: 18.sp,
  ),
  textTheme: GoogleFonts.ubuntuTextTheme(TextTheme(
    bodySmall: TextStyle(
      fontSize: 13.sp,
      color: Colors.black,
      fontWeight: FontWeight.w300,
    ),
    bodyMedium: TextStyle(
      fontSize: 14.sp,
      color: Colors.black,
      fontWeight: FontWeight.w400,
    ),
    titleSmall: TextStyle(
      fontSize: 15.sp,
      color: Colors.black,
      fontWeight: FontWeight.w600,
    ),
    titleMedium: TextStyle(
      fontSize: 16.sp,
      color: Colors.black,
      fontWeight: FontWeight.w600,
    ),
    titleLarge: TextStyle(
      fontSize: 22.sp,
      color: Colors.black,
      fontWeight: FontWeight.w700,
    ),
  )),
);