import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileHeader extends StatelessWidget {
  final File? profileImage;
  final String name;
  final String phone;
  final VoidCallback onEdit;

  const ProfileHeader({
    Key? key,
    required this.profileImage,
    required this.name,
    required this.phone,
    required this.onEdit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.bottomLeft,
          children: [
            CircleAvatar(
              radius: 56.r,
              backgroundImage: profileImage != null
                  ? FileImage(profileImage!)
                  : const AssetImage('assets/images/default_user.jpg') as ImageProvider,
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: GestureDetector(
                onTap: onEdit,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 2.w),
                  ),
                  padding: EdgeInsets.all(6.w),
                  child: Icon(Icons.edit, color: Colors.white, size: 20.sp),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 12.h),
        Text(
          name,
          style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w700),
        ),
        SizedBox(height: 4.h),
        Directionality(
          textDirection: TextDirection.ltr, // ضمان عرض الرقم من اليسار لليمين
          child: Text(
            phone,
            style: TextStyle(fontSize: 14.sp, color: Colors.grey),
          ),
        ),
      ],
    );
  }
}
