import 'package:flutter/material.dart';
import '/core/theme/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class LoadingScreen extends StatelessWidget {
  final String message; // نص الرسالة
  final Widget targetScreen; // الشاشة المستهدفة

  const LoadingScreen({
    Key? key,
    required this.message,
    required this.targetScreen,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // الانتقال إلى الشاشة المستهدفة بعد ثانيتين
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => targetScreen),
      );
    });

    return Scaffold(
      backgroundColor: AppColors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircularProgressIndicator(
              color: AppColors.primary,
            ),
            SizedBox(height: 20.h),
            Text(
              message, // استخدام النص الممرر
              style: GoogleFonts.almarai(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
                color: AppColors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
