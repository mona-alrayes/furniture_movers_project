import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/colors.dart';


class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback? onBack;

  const CustomAppBar({
    Key? key,
    required this.title,
    this.onBack,
  }) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(56.h);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(56.h),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.white ,
          border: Border(
            bottom: BorderSide(
              color: AppColors.regularGrey,
              width: 1, 
            ),
          ),
        ),
        child: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          title: Text(
            title,
            style: GoogleFonts.almarai(
              fontSize: 18.sp,
              fontWeight: FontWeight.w800,
              color: AppColors.black,
            ),
          ),
          actions: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w ),
              child: GestureDetector(
                onTap: onBack ?? () => Navigator.of(context).pop(),
                child: Container(
                  width: 40.w,
                  height: 40.h,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color:AppColors.regularGrey,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Icon(
                    Icons.arrow_forward_ios,
                    size: 20.sp,
                    color: AppColors.grey,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
