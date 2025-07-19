import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'colors.dart';

class AppFonts {
  // appbar
  static TextStyle appBarFont = GoogleFonts.almarai(
    fontSize: 18.sp,
    fontWeight: FontWeight.w800,
    color: AppColors.black,
  );
  //boarding screens
  static TextStyle onBoardingMainFont = GoogleFonts.almarai(
    fontSize: 24.sp,
    fontWeight: FontWeight.w800,
    color: AppColors.black,
  );

  static TextStyle onBoardingSecondaryFont = GoogleFonts.almarai(
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.grey,
  );

  // SignIn and Register Screen fonts
  static TextStyle signInMainHeaderFont = GoogleFonts.tajawal(
    fontSize: 28.sp,
    fontWeight: FontWeight.w800,
    color: AppColors.black,
  );

  static TextStyle signInSecondaryHeaderFont = GoogleFonts.poppins(
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.grey,
  );

  static TextStyle signMainFormFont = GoogleFonts.almarai(
    fontSize: 18.sp,
    fontWeight: FontWeight.w700,
    color: AppColors.black,
  );

  static TextStyle signSecondaryFormFont = GoogleFonts.almarai(
    fontSize: 14.sp,
    fontWeight: FontWeight.w700,
    color: AppColors.grey,
  );

  static TextStyle registerMainFormFont = GoogleFonts.almarai(
    fontSize: 16.sp,
    fontWeight: FontWeight.w700,
    color: AppColors.black,
  );

  // home screen fonts

  // service screens fonts

  // favorite screenst fonts

  //profile screens fonts
  static TextStyle fontName = GoogleFonts.almarai(
    fontSize: 16.sp,
    fontWeight: FontWeight.w700,
    color: AppColors.black,
  );
}
