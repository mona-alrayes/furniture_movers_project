import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furniture_movers_project/screens/service/widgets/rating_bottom_sheet.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:furniture_movers_project/core/theme/colors.dart';
import 'package:furniture_movers_project/core/widgets/custom_appbar.dart';
import 'package:furniture_movers_project/core/widgets/custom_main_button.dart';
import 'package:furniture_movers_project/screens/service/widgets/details_section.dart';
import 'package:furniture_movers_project/screens/service/widgets/questions_section.dart';
import 'package:furniture_movers_project/screens/service/widgets/rating_section.dart';

class ServiceDetails extends StatefulWidget {
  const ServiceDetails({super.key});

  @override
  State<ServiceDetails> createState() => _ServiceDetailsState();
}

class _ServiceDetailsState extends State<ServiceDetails> {
  int selectedTab = 0;

  final List<String> labels = ['تفاصيل', 'التقييم', 'الاسئلة'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: CustomAppBar(title: "معلومات الفني "),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Column(
          children: [
            // Stack: البانر + الصورة الشخصية
            Stack(
              clipBehavior: Clip.none,
              children: [
                Padding(
                  padding: EdgeInsets.all(12.r),
                  child: Container(
                    height: 150.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.r),
                      image: const DecorationImage(
                        image: AssetImage('assets/images/cover_noising.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: -40,
                  right: 30.w,
                  child: Container(
                    width: 112.w,
                    height: 112.w,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 4.w),
                      image: const DecorationImage(
                        image: AssetImage('assets/images/005.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 60.h),

            // Tab Bar
            Container(
              height: 48.h,
              margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
              padding: EdgeInsets.all(4.r),
              decoration: BoxDecoration(
                color: AppColors.veryLightGrey,
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Row(
                children: List.generate(4, (index) {
                  if (index == 3) {
                    // العنصر الرابع: مساحة فارغة
                    return const Expanded(child: SizedBox());
                  }
                  return Expanded(
                    child: InkWell(
                      onTap: () => setState(() => selectedTab = index),
                      borderRadius: BorderRadius.circular(12.r),
                      child: Container(
                        decoration: BoxDecoration(
                          color:
                              selectedTab == index
                                  ? AppColors.primary
                                  : Colors.transparent,
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          labels[index],
                          style: GoogleFonts.almarai(
                            color:
                                selectedTab == index
                                    ? AppColors.white
                                    : AppColors.grey,
                            fontWeight: FontWeight.bold,
                            fontSize: 16.sp,
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),

            // محتوى التاب
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: IndexedStack(
                  index: selectedTab,
                  children: [
                    DetailsSection(),
                    RatingSection(),
                    QuestionsSection(),
                  ],
                ),
              ),
            ),

            // الزر أسفل الشاشة
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
              child: Column(
                children: [
                  if (selectedTab == 0)
                    CustomMainButton(text: "طلب الخدمة", onPressed: () {}),
                  if (selectedTab == 1)
                    CustomMainButton(
                      text: "إضافة تقييم",
                      onPressed: () {
                        showRatingBottomSheet(context);
                      },
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
