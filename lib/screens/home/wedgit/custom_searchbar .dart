import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furniture_movers_project/core/theme/colors.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 16.h),
      child: Row(
        children: [
          // صندوق البحث
          Expanded(
            child: Container(
              height: 50.h,
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12.r),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: TextField(
                textAlign: TextAlign.right,
                decoration: InputDecoration(
                  icon: Icon(Icons.search, color: Colors.grey, size: 24.r),
                  hintText: 'ابحث عن خدمة أو فني',
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 14.sp),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          SizedBox(width: 10.w),
          Container(
            height: 50.h,
            width: 50.w,
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(12.r),
            ),

            child: Image.asset(
              'assets/icons/search.png', // لاحظ استبدال \ بـ / لتجنب مشاكل المسار
              width: 24.w,
              height: 24.h,
            ),
          ),
        ],
      ),
    );
  }
}
