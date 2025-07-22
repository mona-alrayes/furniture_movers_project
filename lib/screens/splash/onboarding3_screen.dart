import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../auth/login_screen.dart';
import 'onboarding2_screen.dart';

class OnboardingScreen3 extends StatelessWidget {
  const OnboardingScreen3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                flex: 5,
                child: Stack(
                  children: [
                    SizedBox.expand(
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(500.r),
                          bottomRight: Radius.circular(500.r),
                        ),
                        child: Image.asset(
                          'assets/images/w3.png.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    // تم حذف زر التخطي من هنا
                  ],
                ),
              ),
              SizedBox(height: 16.h),
              SmoothPageIndicator(
                controller: _FakePageController(2),
                count: 3,
                effect: ExpandingDotsEffect(
                  expansionFactor: 4,
                  dotHeight: 8.h,
                  dotWidth: 8.w,
                  spacing: 4.w,
                  dotColor: Colors.grey.shade300,
                  activeDotColor: const Color(0xFF4F8CFF),
                ),
              ),
              SizedBox(height: 32.h),
              Text(
                'راحة بالك هي أولويتنا',
                style: GoogleFonts.cairo(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 16.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Text(
                  'خدمة عملاء سريعة وداعمة على مدار الساعة لراحتك ورضاك التام.',
                  style: GoogleFonts.cairo(
                    fontSize: 16.sp,
                    color: Colors.grey[500],
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const Spacer(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: SizedBox(
                  width: double.infinity,
                  height: 48.h,
                  child: ElevatedButton(
                    onPressed: () => Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (_) => const LoginScreen()),
                    ),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      padding: EdgeInsets.zero,
                      elevation: 0,
                      backgroundColor: null,
                    ).copyWith(
                      backgroundColor: MaterialStateProperty.resolveWith<Color?>(
                        (states) => null,
                      ),
                      foregroundColor: MaterialStateProperty.all<Color>(
                        Colors.white,
                      ),
                    ),
                    child: Ink(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [Color(0xFF4B75CB), Color(0xFF4999CB)],
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                      ),
                      child: Center(
                        child: Text(
                          'التالي',
                          style: GoogleFonts.cairo(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 12.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: SizedBox(
                  width: double.infinity,
                  height: 48.h,
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (_) => const OnboardingScreen2()),
                      );
                    },
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(
                        color: Color(0xFF4F8CFF),
                        width: 1.5,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                    ),
                    child: Text(
                      'رجوع',
                      style: GoogleFonts.cairo(
                        fontSize: 18.sp,
                        color: const Color(0xFF4F8CFF),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 24.h),
            ],
          ),
        ),
      ),
    );
  }
}

class _FakePageController extends PageController {
  final int fixedIndex;
  _FakePageController(this.fixedIndex);
  @override
  double get page => fixedIndex.toDouble();
}
