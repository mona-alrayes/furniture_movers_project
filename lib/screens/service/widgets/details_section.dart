import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furniture_movers_project/core/theme/colors.dart';
import 'package:furniture_movers_project/screens/service/models/employee_model.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailsSection extends StatelessWidget {
  final EmployeeModel employee;
  const DetailsSection({super.key, required this.employee});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.r),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                employee.jobTitle,
                style: GoogleFonts.almarai(
                  fontWeight: FontWeight.w800,
                  fontSize: 20.sp,
                ),
              ),
              const Spacer(),
              Text(
                employee.rating.toString(),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              Icon(Icons.star, color: Colors.amber, size: 28.sp),
              SizedBox(width: 10.w),
              Icon(Icons.favorite_border, color: Colors.redAccent),
              SizedBox(width: 10.w),
              Icon(Icons.share, color: Colors.black54),
            ],
          ),
          SizedBox(height: 16.h),
          Text(
            '\$${employee.price}',
            style: GoogleFonts.almarai(
              color: AppColors.primary,
              fontWeight: FontWeight.w600,
              fontSize: 20.sp,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            employee.name,
            style: GoogleFonts.almarai(
              fontWeight: FontWeight.w700,
              fontSize: 16.sp,
            ),
          ),
          SizedBox(height: 16.h),
          Text(
            employee.description,
            style: GoogleFonts.almarai(
              color: Colors.grey.shade500,
              fontSize: 16.5.sp,
              fontWeight: FontWeight.w700,
              height: 1.7.h,
            ),
          ),
        ],
      ),
    );
  }
}
