import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furniture_movers_project/core/theme/colors.dart';
import 'package:furniture_movers_project/core/theme/fonts.dart';

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
              child: TextField(
                textAlign: TextAlign.right,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search, color: Colors.grey, size: 24),
                  hintText: 'ابحث عن خدمة أو فني',
                  hintStyle: AppFonts.aboutAppBodyFormFont,
                  isDense: true,
                  contentPadding: EdgeInsets.symmetric(vertical: 12.0.h),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: BorderSide(color: Colors.grey.shade300),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: BorderSide(color: Colors.grey.shade300),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: BorderSide(color: Colors.blue),
                  ),
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
