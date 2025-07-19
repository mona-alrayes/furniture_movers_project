import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../theme/colors.dart';

class CustomMainButton extends StatelessWidget {
  final String text;
  final Color? color;
  final LinearGradient? gradient = AppColors.linears;
  final double width = 380;
  final double height = 48;
  final VoidCallback onPressed;
  final TextStyle? textStyle;

   CustomMainButton({
    Key? key,
    required this.text,
    this.color,
    required this.onPressed,
    this.textStyle,
  }); 

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width.w,
      height: height.h,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: color,
          gradient: gradient,
          borderRadius: BorderRadius.circular(8),
        ),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            elevation: 0,
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.r),
            ),
          ),
          onPressed: onPressed,
          child: Text(
            text,
            style: textStyle ??
                GoogleFonts.almarai(
                  color: AppColors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
          ),
        ),
      ),
    );
  }
}
