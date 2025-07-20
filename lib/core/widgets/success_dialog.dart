import 'package:flutter/material.dart';
import 'package:furniture_movers_project/core/theme/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SuccessDialog extends StatelessWidget {
  final String message;
  final VoidCallback? onConfirm;

  const SuccessDialog({Key? key, required this.message, this.onConfirm})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
              child: Column(
                children: [
                  //  Success Icon
                  Image.asset(
                    'assets/icons/successful.png',
                    width: 74.w,
                    height: 78.63.h,
                  ),
                  SizedBox(height: 16.h),

                  //  Message
                  Text(
                    message,
                    style: GoogleFonts.almarai(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w700,
                      color: AppColors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            //  Divider
            Divider(height: 1, thickness: 1, color: const Color(0xFFF2F4F7)),
            InkWell(
              onTap: onConfirm ?? () => Navigator.of(context).pop(),
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 14.h),
                alignment: Alignment.center,
                child: Text(
                  'موافق',
                  style: GoogleFonts.almarai(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                    color: AppColors.primary,
                  ),
                ),
              ),
            ),
            SizedBox(height: 5.h),
          ],
        ),
      ),
    );
  }
}
