import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furniture_movers_project/core/theme/colors.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomBttonHajz extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final TextStyle? textStyle;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? padding;

  const CustomBttonHajz({
    Key? key,
    required this.text,
    required this.onPressed,
    this.textStyle,
    this.width,
    this.height,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? 162.w, // عرض افتراضي مناسب
      height: height ?? 40.h, // ارتفاع افتراضي مناسب
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40.r),
          ),
          padding:
              padding ?? EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
        ),
        onPressed: onPressed,
        child: Container(
          decoration: BoxDecoration(
            gradient: AppColors.linears,
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Center(
            child: Text(
              text,
              style:
                  textStyle ??
                  GoogleFonts.almarai(
                    color: AppColors.white,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                  ),
            ),
          ),
        ),
      ),
    );
  }
}
