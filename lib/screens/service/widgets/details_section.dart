import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furniture_movers_project/core/theme/colors.dart';
import 'package:furniture_movers_project/core/widgets/custom_appbar.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailsSection extends StatelessWidget {
  const DetailsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'ناقل أثاث',
                    style: GoogleFonts.almarai(
                      fontWeight: FontWeight.w800,
                      fontSize: 20.sp,
                    ),
                  ),
                  Spacer(),

                  Text(
                    '5',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  // SizedBox(width: 4),
                  Icon(Icons.star, color: Colors.amber, size: 28.sp),
                  SizedBox(width: 10.w),
                  Container(
                    width: 40.w,
                    height: 40.h,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(Icons.favorite_border, color: Colors.redAccent),
                  ),
                  SizedBox(width: 10.w),
                  Container(
                    width: 40.w,
                    height: 40.h,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(Icons.share, color: Colors.black54),
                  ),
                ],
              ),

              SizedBox(height: 16.h),
              Text(
                '\$\14.4',
                style: GoogleFonts.almarai(
                  color: AppColors.primary,
                  fontWeight: FontWeight.w600,
                  fontSize: 20.sp,
                ),
              ),
              SizedBox(height: 8.h),
              Text(
                'علي عبدالله سعيد',
                style: GoogleFonts.almarai(
                  fontWeight: FontWeight.w700,
                  fontSize: 16.sp,
                ),
              ),
              SizedBox(height: 16.h),
              Text.rich(
                TextSpan(
                  text:
                      'تقدم خدمة نقل الأثاث لدينا حلًا كاملًا وآمنًا لنقل أثاثك، بأمان وسهولة. مع تغليف احترافي وفك وتركيب الأثاث ونقل الأثاث الثقيل. فريقنا المتخصص يضمن لك عملية نقل خالية من التوتر مع خدمات تخزين مؤقتة وأسعار تنافسية. اجعل انتقالك سهلًا معنا.. ',
                  style: GoogleFonts.almarai(
                    color: Colors.grey.shade500,
                    fontSize: 16.5.sp,
                    fontWeight: FontWeight.w700,
                    height: 1.7.h,
                  ),
                  children: [
                    TextSpan(
                      text: 'قراءة المزيد',
                      style: GoogleFonts.almarai(
                        color: AppColors.primary,
                        fontWeight: FontWeight.w400,
                        fontSize: 16.5.sp,
                        decoration: TextDecoration.underline,
                        decorationColor: AppColors.primary,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
