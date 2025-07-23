import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furniture_movers_project/core/theme/colors.dart';
import 'package:furniture_movers_project/core/theme/fonts.dart';

class RatingSection extends StatefulWidget {
  const RatingSection({Key? key}) : super(key: key);

  @override
  State<RatingSection> createState() => _RatingSectionState();
}

class _RatingSectionState extends State<RatingSection> {
  double rating = 5;

  @override
  Widget build(BuildContext context) {
    const Color mainBlue = Color(0xFF3B5BA9);

    double fiveStars = (rating >= 5.0) ? 1.0 : 0.6;
    double fourStars = (rating >= 4.0) ? 0.2 : 0.1;
    double threeStars = (rating >= 3.0) ? 0.1 : 0.05;
    double twoStars = (rating >= 2.0) ? 0.1 : 0.05;
    double oneStar = (rating >= 1.0) ? 0.05 : 0.02;

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 32.w),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            textDirection: TextDirection.rtl,
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(right: 6.w),
                  child: Column(
                    children: [
                      {'percent': fiveStars, 'label': '5 نجوم'},
                      {'percent': fourStars, 'label': '4 نجوم'},
                      {'percent': threeStars, 'label': '3 نجوم'},
                      {'percent': twoStars, 'label': '2 نجوم'},
                      {'percent': oneStar, 'label': '1 نجمة'},
                    ].map((r) {
                      return Padding(
                        padding: EdgeInsets.only(bottom: 12.h),
                        child: Row(
                          children: [
                            Text(
                              '${((r['percent'] as double) * 100).toInt()} %',
                              style: AppFonts.ratingFont
                            ),
                            SizedBox(width: 8.w),
                            Expanded(
                              child: Stack(
                                children: [
                                  Container(
                                    height: 8.h,
                                    decoration: BoxDecoration(
                                      color: const Color(0xFFE9F0FB),
                                      borderRadius: BorderRadius.circular(6.r),
                                    ),
                                  ),
                                  FractionallySizedBox(
                                    widthFactor: r['percent'] as double,
                                    child: Container(
                                      height: 8.h,
                                      decoration: BoxDecoration(
                                        color: mainBlue,
                                        borderRadius: BorderRadius.circular(6.r),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: 8.w),
                            Text(
                              r['label'] as String,
                              style: TextStyle(
                                color: Colors.grey.shade700,
                                fontSize: 14.sp,
                              ),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),

              SizedBox(width: 13.w),

              Padding(
                padding: EdgeInsets.only(left: 24.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 16.h),
                    Text(
                      '$rating',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30.sp,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 2.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(5, (index) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                rating = (index + 1).toDouble();
                              });
                            },
                            child: Icon(
                              index < rating
                                  ? Icons.star
                                  : Icons.star_border,
                              color: AppColors.yellow,
                              size: 24.sp,
                            ),
                          );
                        }),
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      '36 تقييم',
                      style: AppFonts.ratingFont
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
