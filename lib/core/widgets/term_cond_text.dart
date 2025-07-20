import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furniture_movers_project/core/theme/fonts.dart';

//يعطي شكل السطر اللي فيه تعداد نقطي
class BulletTextItem extends StatelessWidget {
  final String text;

  const BulletTextItem({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(width: 8.w),
          Text("•", style: AppFonts.termCondBodyFormFont),
          SizedBox(width: 6.w),
          Expanded(child: Text(text, style: AppFonts.termCondBodyFormFont)),
        ],
      ),
    );
  }
}

//محتوى شروط الخدمة
class TermCondContentBody extends StatelessWidget {
  const TermCondContentBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("1. قبول الشروط", style: AppFonts.termCondTitleFormFont),
          SizedBox(height: 8.h),
          Text(
            "باستخدامك لتطبيق خدماتك، فإنك توافق على الالتزام بشروط الخدمة هذه. إذا كنت لا توافق على أي جزء من الشروط، يجب عليك عدم استخدام التطبيق.",
            style: AppFonts.termCondBodyFormFont,
          ),
          SizedBox(height: 7.h),
          Text(
            "2. التعديلات على الشروط",
            style: AppFonts.termCondTitleFormFont,
          ),
          SizedBox(height: 8.h),
          Text(
            "نحتفظ بالحق في تعديل شروط الخدمة في أي وقت. سيتم إعلامك بهذه التعديلات عبر التطبيق أو البريد الإلكتروني. استمرارك في استخدام التطبيق بعد التعديلات يعني موافقتك على الشروط المعدلة.",
            style: AppFonts.termCondBodyFormFont,
          ),
          SizedBox(height: 7.h),
          Text("3. استخدام التطبيق", style: AppFonts.termCondTitleFormFont),
          SizedBox(height: 8.h),
          BulletTextItem(
            text: "يجب أن تكون فوق السن القانوني المسموح به لاستخدام التطبيق.",
          ),
          BulletTextItem(
            text:
                "يجب تقديم معلومات دقيقة وكاملة عند التسجيل واستخدام التطبيق.",
          ),
          BulletTextItem(
            text: "يمنع استخدام التطبيق لأي أغراض غير قانونية أو غير مصرح بها.",
          ),
          SizedBox(height: 7.h),
          Text("4. الخدمات المقدمة", style: AppFonts.termCondTitleFormFont),
          SizedBox(height: 8.h),
          BulletTextItem(
            text:
                "يوفر خدماتك مجموعة متنوعة من الخدمات المنزلية بما في ذلك نقل الأثاث، التنظيف، وصيانة الأجهزة.",
          ),
          BulletTextItem(
            text:
                "نحن نسعى لتقديم خدمات عالية الجودة من خلال محترفين ذوي خبرة.",
          ),
          BulletTextItem(
            text: "قد تختلف توفر الخدمات والأسعار حسب الموقع والوقت.",
          ),
          SizedBox(height: 7.h),
          Text("5. الدفع", style: AppFonts.termCondTitleFormFont),
          SizedBox(height: 8.h),
          BulletTextItem(text: "يتم تحديد أسعار الخدمات في التطبيق."),
          BulletTextItem(
            text:
                "يجب دفع الرسوم المطلوبة باستخدام وسائل الدفع المتاحة في التطبيق.",
          ),
          BulletTextItem(
            text: "قد نفرض رسوم إلغاء في حال إلغاء الخدمة بعد تأكيد الحجز.",
          ),
          SizedBox(height: 7.h),
          Text("6. المسؤولية", style: AppFonts.termCondTitleFormFont),
          SizedBox(height: 8.h),
          BulletTextItem(
            text:
                "نحن نبذل قصارى جهدنا لضمان سلامة وجودة الخدمات المقدمة، ولكننا لا نتحمل مسؤولية أي أضرار أو خسائر تنشأ عن استخدام التطبيق أو الخدمات المقدمة.",
          ),
          BulletTextItem(
            text: "يتم تقديم الخدمات كما هي،دون أي ضمانات صريحةأوضمنية.",
          ),
          SizedBox(height: 7.h),
          Text("7. الإلغاء والاسترداد", style: AppFonts.termCondTitleFormFont),
          SizedBox(height: 8.h),
          BulletTextItem(
            text:
                "يمكنك إلغاء الخدمة عبر التطبيق، ولكن قد يتم تطبيق رسوم إلغاء حسب وقت الإلغاء.",
          ),
          BulletTextItem(
            text:
                "في حالة عدم الرضا عن الخدمة، يرجى التواصل معنا عبر الدعم لنظر في طلبات الاسترداد.",
          ),
          SizedBox(height: 7.h),
          Text("8. الخصوصية", style: AppFonts.termCondTitleFormFont),
          SizedBox(height: 8.h),
          BulletTextItem(
            text:
                "نحن نحترم خصوصيتك ونتعهد بحماية بياناتك الشخصية وفقًا لسياسة الخصوصية الخاصة بنا.",
          ),
          SizedBox(height: 7.h),
          Text("9. القانون المعمول به", style: AppFonts.termCondTitleFormFont),
          Text(
            "تخضع شروط الخدمة هذه وتفسر وفقًا لقوانين [الدولة/المنطقة].",
            style: AppFonts.termCondBodyFormFont,
          ),
          SizedBox(height: 7.h),
          Text("10. الاتصال بنا", style: AppFonts.termCondTitleFormFont),
          SizedBox(height: 8.h),
          Text(
            "لأي استفسارات أو ملاحظات حول شروط الخدمة،يرجى الاتصال بنا عبر [البريد الإلكتروني أو رقم الهاتف].",
            style: AppFonts.termCondBodyFormFont,
          ),
        ],
      ),
    );
  }
}
