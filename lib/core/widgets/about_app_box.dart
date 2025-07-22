import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furniture_movers_project/core/theme/colors.dart';
import 'package:furniture_movers_project/core/theme/fonts.dart';

//بوكس المقدمة
class AboutAppIntroBox extends StatelessWidget {
  const AboutAppIntroBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border(right: BorderSide(color: AppColors.primary, width: 4.w)),
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(25.r),
          bottomRight: Radius.circular(25.r),
        ),
      ),
      padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 12.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text("مقدمة", style: AppFonts.aboutAppHedarFormFont),
          SizedBox(height: 8.h),
          Text(
            'هو تطبيق شامل يقدم لك جميع الخدمات المنزلية التي تحتاجها في مكان واحد. سواء كنت تبحث عن نقل الأثاث، تنظيف المنزل، أو صيانة الأجهزة، يمكن لتطبيق "خدماتك" تلبية جميع احتياجاتك بكفاءة واحترافية. مع خدماتك، يمكنك حجز الخدمة التي تريدها بسهولة والاستمتاع براحة البال.',
            style: AppFonts.aboutAppBodyFormFont,
            textAlign: TextAlign.right,
          ),
        ],
      ),
    );
  }
}

//بوكس مميزات التطبيق
class AboutAppFeaturesBox extends StatelessWidget {
  const AboutAppFeaturesBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border(right: BorderSide(color: AppColors.primary, width: 4.w)),
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(25.r),
          bottomRight: Radius.circular(25.r),
        ),
      ),
      padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 12.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(":مميزات التطبيق", style: AppFonts.aboutAppHedarFormFont),
          SizedBox(height: 8.h),
          Directionality(
            textDirection: TextDirection.rtl,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "1. تنوع الخدمات: نقل الأثاث، تنظيف شامل، صيانة الأجهزة، والمزيد.",
                  style: AppFonts.aboutAppBodyFormFont,
                ),
                SizedBox(height: 6.h),
                Text(
                  "2. سهولة الحجز: واجهة مستخدم بسيطة ومريحة تتيح لك حجز الخدمات في دقائق.",
                  style: AppFonts.aboutAppBodyFormFont,
                ),
                SizedBox(height: 6.h),
                Text(
                  "3. احترافية: فريق متخصص من المهنيين لضمان أفضل جودة للخدمات.",
                  style: AppFonts.aboutAppBodyFormFont,
                ),
                SizedBox(height: 6.h),
                Text(
                  "4. الأمان: ضمان سلامة ممتلكاتك أثناء تقديم الخدمات.",
                  style: AppFonts.aboutAppBodyFormFont,
                ),
                SizedBox(height: 6.h),
                Text(
                  "5. موثوقية: تقييمات ومراجعات من مستخدمين آخرين لضمان رضاك.",
                  style: AppFonts.aboutAppBodyFormFont,
                ),
                SizedBox(height: 12.h),
                Text(
                  "جرب خدماتك اليوم واجعل حياتك أسهل مع مجموعة متنوعة من الخدمات المنزلية المتاحة بنقرة واحدة!",
                  style: AppFonts.aboutAppBodyFormFont,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
