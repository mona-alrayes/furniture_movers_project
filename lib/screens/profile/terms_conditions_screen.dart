import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furniture_movers_project/core/theme/colors.dart';
import 'package:furniture_movers_project/core/theme/fonts.dart';
import 'package:furniture_movers_project/core/widgets/custom_appbar.dart';
import 'package:furniture_movers_project/core/widgets/term_cond_text.dart';

class TermsConditionsScreen extends StatelessWidget {
  const TermsConditionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: CustomAppBar(title: "شروط الخدمة"),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: 18.h, right: 24.w, left: 23.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Directionality(
              textDirection: TextDirection.rtl,
              child: RichText(
                text: TextSpan(
                  style: AppFonts.termCondTitleFormFont,
                  children: [
                    TextSpan(text: "مرحبًا بك في "),
                    TextSpan(
                      text: "خدماتك!",
                      style: AppFonts.termCondTitleFormFont.copyWith(
                        color: AppColors.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text:
                          " قبل استخدام تطبيقنا، يرجى قراءة شروط الخدمة التالية بعناية:",
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10.h),
            Directionality(
              textDirection: TextDirection.rtl,
              child: TermCondContentBody(),
            ),
            SizedBox(height: 32.h),
          ],
        ),
      ),
    );
  }
}
