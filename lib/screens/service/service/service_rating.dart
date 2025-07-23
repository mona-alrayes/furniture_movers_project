import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ServiceRatingScreen extends StatelessWidget {
  const ServiceRatingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const Color mainBlue = Color(0xff4A87CB);
    const Color barBg = Color(0xFFE9F0FB);
    const Color starColor = Color(0xFFFFC107);

    final ratings = [
      {'label': '5 نجوم', 'percent': 0.6},
      {'label': '4 نجوم', 'percent': 0.2},
      {'label': '3 نجوم', 'percent': 0.1},
      {'label': '2 نجوم', 'percent': 0.07},
      {'label': '1 نجمة', 'percent': 0.03},
    ];

    const double currentRating = 4.5;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 80.h),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 24.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            currentRating.toString(),
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 32.sp,
                            ),
                          ),
                          SizedBox(height: 4.h),
                          Row(
                            children: List.generate(5, (index) {
                              return Icon(
                                index < currentRating.floor()
                                    ? Icons.star
                                    : Icons.star_border,
                                color: starColor,
                                size: 24.r,
                              );
                            }),
                          ),
                          SizedBox(height: 4.h),
                          Text(
                            '36 تقييم',
                            style: TextStyle(
                              color: Colors.grey.shade500,
                              fontSize: 14.sp,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(left: 24.w),
                        child: Column(
                          children:
                          ratings.map((r) {
                            return Padding(
                              padding: EdgeInsets.only(bottom: 12.h),
                              child: Row(
                                children: [
                                  Text(
                                    '${((r['percent'] as double) * 100).toInt()}%',
                                    style: TextStyle(
                                      color: mainBlue,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12.sp,
                                    ),
                                  ),
                                  SizedBox(width: 8.w),
                                  Expanded(
                                    child: Stack(
                                      children: [
                                      Container(
                                      height: 8.h,
                                      decoration: BoxDecoration(
                                          color: barBg,
                                          borderRadius:
                                          BorderRadius.circular(6.r),
                                    ),
                                  ),
                                  FractionallySizedBox(
                                    widthFactor:
                                    r['percent'] as double,
                                    child: Container(
                                      height: 8.h,
                                      decoration: BoxDecoration(
                                        color: mainBlue,
                                        borderRadius:
                                        BorderRadius.circular(
                                          6.r,
                                        ),
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
                  ],
                ),

                SizedBox(height: 48.h),

                SizedBox(
                  width: double.infinity,
                  height: 48.h,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: mainBlue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                    ),
                    onPressed: () {
                    },
                    child: Text(
                      'إضافة تقييم',
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}