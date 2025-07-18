import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/colors.dart';


class CustomSecondaryButton extends StatelessWidget {
  final String text;
  final double width = 380;
  final double height = 48;
  final VoidCallback onPressed;
  final TextStyle? textStyle;

  CustomSecondaryButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.textStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width.w,
      height: height.h,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: AppColors.white,
          border: Border.all(
            color: AppColors.primary,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.r),
            ),
          ),
          onPressed: onPressed,
          child: Text(
            text,
            style: textStyle ??
                GoogleFonts.almarai(
                  fontSize: 16,
                  color: AppColors.primary,
                  fontWeight: FontWeight.w600,
                ),
          ),
        ),
      ),
    );
  }
}
