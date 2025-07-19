import 'package:flutter/material.dart';
import 'package:furniture_movers_project/core/theme/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furniture_movers_project/screens/auth/login_screen.dart';

class LogoutDialog extends StatelessWidget {
  const LogoutDialog({super.key});

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
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 35.h),
              child: Column(
                children: [
                  // Logout Icon
                  Image.asset(
                    'assets/icons/dialog_logout.png',
                    width: 74.w,
                    height: 78.63.h,
                  ),
                  SizedBox(height: 16.h),
                  // Message
                  Text(
                    'هل أنت متأكد أنك تريد تسجيل الخروج',
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

            Divider(height: 1, thickness: 1, color: const Color(0xFFF2F4F7)),

            // Confirm Button
            InkWell(
              onTap: () {
                Navigator.of(context).pop(); // إغلاق الديالوج الحالي
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => const LogoutLoadingScreen(),
                  ),
                );
              },
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 16.h),
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

            Divider(height: 1, thickness: 1, color: const Color(0xFFF2F4F7)),

            // Cancel Button
            InkWell(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 14.h),
                alignment: Alignment.center,
                child: Text(
                  'رجوع',
                  style: GoogleFonts.almarai(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                    color: AppColors.black,
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

/// شاشة تحميل كاملة
class LogoutLoadingScreen extends StatefulWidget {
  const LogoutLoadingScreen({super.key});

  @override
  State<LogoutLoadingScreen> createState() => _LogoutLoadingScreenState();
}

class _LogoutLoadingScreenState extends State<LogoutLoadingScreen> {
  @override
  void initState() {
    super.initState();
    // الانتقال إلى صفحة تسجيل الدخول بعد ثانيتين
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      );

    });
  }

  @override
  Widget build(BuildContext context) {
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
              'تسجيل الخروج...',
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
