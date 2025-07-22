import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furniture_movers_project/core/theme/colors.dart';
import 'package:furniture_movers_project/core/widgets/custom_appbar.dart';
import 'package:furniture_movers_project/screens/service/widgets/details_section.dart';
import 'package:furniture_movers_project/screens/service/widgets/questions_section.dart';
import 'package:furniture_movers_project/screens/service/widgets/rating_bottom_sheet.dart';
import 'package:furniture_movers_project/screens/service/widgets/rating_section.dart';
import 'package:google_fonts/google_fonts.dart';

class ServiceDetailsScreen extends StatefulWidget {
  const ServiceDetailsScreen({Key? key}) : super(key: key);

  @override
  State<ServiceDetailsScreen> createState() => _ServiceDetailsScreenState();
}

class _ServiceDetailsScreenState extends State<ServiceDetailsScreen> {
  int selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    const Color mainBlue = Color(0xff4B75CB);
    const Color blueservice = Color(0xff4A87CB);
    const Color tabInactive = Color(0xFFF7F8FA);
    const Color tabInactiveText = Color(0xFFB1B1B1);
    const Color dividerColor = Color(0xFFF1F1F1);
    const String profileImageAsset = 'assets/images/005.jpg';

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: CustomAppBar(title: "معلومات الفني"),
        // appBar: PreferredSize(
        //   preferredSize: Size.fromHeight(56.h),
        //   child: Container(
        //     decoration: BoxDecoration(
        //       color: AppColors.white,
        //       border: Border(
        //         bottom: BorderSide(color: AppColors.regularGrey, width: 1),
        //       ),
        //     ),
        //     child: Padding(
        //       padding: const EdgeInsets.all(4.0),
        //       child: AppBar(
        //         backgroundColor: Colors.transparent,
        //         elevation: 0,
        //         title: Text(
        //           "نقل أثاث",
        //           style: GoogleFonts.almarai(fontWeight: FontWeight.w800),
        //         ),
        //         centerTitle: true,
        //         leading: Padding(
        //           padding: EdgeInsets.symmetric(
        //             horizontal: 24.w,
        //             vertical: 5.w,
        //           ),
        //           child: InkWell(
        //             onTap: () {
        //               Navigator.of(context).pop();
        //             },
        //             child: Container(
        //               width: 40.w,
        //               height: 40.h,
        //               decoration: BoxDecoration(
        //                 border: Border.all(
        //                   color: AppColors.regularGrey,
        //                   width: 1,
        //                 ),
        //                 borderRadius: BorderRadius.circular(8.r),
        //               ),
        //               child: Icon(
        //                 Icons.arrow,
        //                 size: 18.sp,
        //                 color: AppColors.grey,
        //               ),
        //             ),
        //           ),
        //         ),
        //       ),
        // ),
        // ),
        // ),
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Stack(
            children: [
              // الخط الفاصل أسفل التاب
              Positioned(
                top: 310.h,
                left: 0,
                right: 0,
                child: const Divider(thickness: 1, color: dividerColor),
              ),

              // صورة الغلاف
              Positioned(
                top: 80.h,
                left: 16.w,
                right: 16.w,
                child: Container(
                  height: 120.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.r),
                    image: DecorationImage(
                      image: AssetImage('assets/images/cover_noising.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),

              // صورة البروفايل الدائرية
              Positioned(
                top: 140.h,
                right: 45.w,
                child: Container(
                  width: 108.w,
                  height: 108.w,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 6.w),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 6,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: ClipOval(
                    child: Image.asset(profileImageAsset, fit: BoxFit.cover),
                  ),
                ),
              ),

              // شريط التاب
              Positioned(
                top: 265.h,
                left: 16.w,
                right: 16.w,
                child: Container(
                  height: 48.h,
                  decoration: BoxDecoration(
                    color: tabInactive,
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: Row(
                    children: List.generate(3, (index) {
                      final labels = ['تفاصيل', 'التقييم', 'الاسئلة'];
                      return Expanded(
                        child: InkWell(
                          onTap: () => setState(() => selectedTab = index),
                          child: Container(
                            decoration: BoxDecoration(
                              color:
                                  selectedTab == index ? mainBlue : tabInactive,
                              borderRadius: BorderRadius.circular(12.r),
                            ),
                            child: Center(
                              child: Text(
                                labels[index],
                                style: TextStyle(
                                  color:
                                      selectedTab == index
                                          ? Colors.white
                                          : tabInactiveText,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16.sp,
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                ),
              ),

              // محتوى التاب (تفاصيل - تقييم - اسئلة)
              Positioned(
                top: 330.h,
                left: 0,
                right: 0,
                bottom: 88.h,
                child: Builder(
                  builder: (_) {
                    switch (selectedTab) {
                      case 0:
                        return const DetailsSection();
                      case 1:
                        return const RatingSection();
                      case 2:
                        return const QuestionsSection();
                      default:
                        return const SizedBox();
                    }
                  },
                ),
              ),

              // أزرار أسفل الشاشة حسب التاب المحدد
              if (selectedTab == 0)
                Positioned(
                  left: 24.w,
                  right: 24.w,
                  bottom: 32.h,
                  child: SizedBox(
                    height: 56.h,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: mainBlue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                      ),
                      onPressed: () {},
                      child: Text(
                        'طلب الخدمة',
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),

              if (selectedTab == 1)
                Positioned(
                  left: 24.w,
                  right: 24.w,
                  bottom: 32.h,
                  child: SizedBox(
                    height: 48.h,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: blueservice,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                      ),
                      onPressed: () {
                        showRatingBottomSheet(context);
                      },
                      child: Text(
                        'اضافة تقييم',
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
