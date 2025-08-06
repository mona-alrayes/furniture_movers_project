import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/colors.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final IconData icon;
  final String? Function(String?) validator;

  const CustomTextField({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.icon,
    required this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      textAlign: TextAlign.right,
      style: const TextStyle(color: AppColors.grey),
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.veryLightGrey,
        suffixIcon: Icon(icon, color: AppColors.mediumPrimary),
        hintText: hintText,
        hintStyle: GoogleFonts.almarai(
          fontSize: 16.sp,
          fontWeight: FontWeight.w400,
          color: AppColors.mediumGrey,
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 12.w),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide.none,
        ),
        errorStyle: TextStyle(fontSize: 12.sp),
      ),
    );
  }
}
