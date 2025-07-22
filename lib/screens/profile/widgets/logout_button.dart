import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furniture_movers_project/core/theme/colors.dart';

class LogoutButton extends StatelessWidget {
  final VoidCallback onTap;

  const LogoutButton({Key? key, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(color: AppColors.regularGrey, width: 1.w),
        ),
        child: ListTile(
          leading: Image.asset(
            'assets/icons/logout.png',
            width: 24.w,
            height: 24.w,
            color: Colors.red,
          ),
          title: Text(
            'تسجيل خروج',
            style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold, fontSize: 16.sp),
          ),
          onTap: onTap,
        ),
      ),
    );
  }
}
