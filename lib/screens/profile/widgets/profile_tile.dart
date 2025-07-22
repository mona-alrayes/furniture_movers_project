import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furniture_movers_project/core/theme/colors.dart';

class ProfileTile extends StatelessWidget {
  final String icon;
  final String text;
  final VoidCallback onTap;

  const ProfileTile({
    Key? key,
    required this.icon,
    required this.text,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(color: AppColors.regularGrey, width: 1.w),
        ),
        child: ListTile(
          leading: Image.asset(icon, width: 24.w, height: 24.w),
          title: Text(text, style: TextStyle(fontSize: 16.sp)),
          trailing: Image.asset(
            'assets/icons/chevron-left.png',
            width: 24.w,
            height: 24.w,
            color: AppColors.primary,
          ),
          onTap: onTap,
        ),
      ),
    );
  }
}
