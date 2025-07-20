import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furniture_movers_project/core/theme/colors.dart';
import 'package:furniture_movers_project/core/theme/fonts.dart';
import 'package:furniture_movers_project/core/widgets/about_app_box.dart';
import 'package:furniture_movers_project/core/widgets/custom_appbar.dart';

class AboutAppScreen extends StatelessWidget {
  const AboutAppScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: CustomAppBar(title: "حول التطبيق"),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: 30.h, right: 24.w, left: 24.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            
            Directionality(
              textDirection: TextDirection.rtl,
              child: RichText(
                text: TextSpan(
                  style: AppFonts.aboutAppTitle1FormFont,
                  children: [
                    TextSpan(text: "تطبيق "),
                    TextSpan(
                      text: "خدماتك",
                      style: AppFonts.aboutAppTitle2FormFont.copyWith(
                        color: AppColors.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(text: " لخدمة نقل الأثاث لنظام الاندرويد"),
                  ],
                ),
              ),
            ),
            SizedBox(height: 24.h),

            // بوكس "مقدمة"
            AboutAppIntroBox(),
            SizedBox(height: 23.h),
            // بوكس "مميزات التطبيق"
            AboutAppFeaturesBox(),
            SizedBox(height: 30.h),
            Text("الإصدار", style: AppFonts.aboutAppHedarFormFont),
            SizedBox(height: 8.h),
            Text("1.0", style: AppFonts.aboutAppBodyFormFont),
          ],
        ),
      ),
    );
  }
}
