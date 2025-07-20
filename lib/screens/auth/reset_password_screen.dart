import 'package:flutter/material.dart';
import 'package:furniture_movers_project/core/widgets/success_dialog.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import '/core/theme/colors.dart';
import '/core/widgets/custom_main_button.dart';
import '../../core/theme/fonts.dart';
import '../../core/widgets/custom_appbar.dart';

class RestPasswordScreen extends StatefulWidget {
  const RestPasswordScreen({super.key});

  @override
  State<RestPasswordScreen> createState() => _RestPasswordScreenState();
}

class _RestPasswordScreenState extends State<RestPasswordScreen> {
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: CustomAppBar(title: 'إعادة تعيين كلمة المرور'),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.asset(
                  'assets/images/Reset password-cuate.png',
                  width: 320.w,
                  height: 320.h,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 16.h),

              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  'كلمة المرور',
                  style: GoogleFonts.almarai(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w700,
                    color: AppColors.black,
                  ),
                ),
              ),
              SizedBox(height: 16.h),

              ///  Password Input
              SizedBox(
                height: 48.h,
                child: TextField(
                  obscureText: _obscurePassword,
                  textAlign: TextAlign.right,
                  style: TextStyle(color: AppColors.grey),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: AppColors.veryLightGrey,
                    border: InputBorder.none,
                    prefixIcon: IconButton(
                      icon: Icon(
                        _obscurePassword
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: AppColors.grey,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscurePassword = !_obscurePassword;
                        });
                      },
                    ),
                    suffixIcon: const Icon(
                      Icons.lock_open,
                      color: AppColors.mediumPrimary,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 24.h),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  'تأكيد كلمة المرور',
                  style: GoogleFonts.almarai(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w700,
                    color: AppColors.black,
                  ),
                ),
              ),
              SizedBox(height: 16.h),

              ///  confirm Password Input
              SizedBox(
                height: 48.h,
                child: TextField(
                  obscureText: _obscurePassword,
                  textAlign: TextAlign.right,
                  style: TextStyle(color: AppColors.grey),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: AppColors.veryLightGrey,
                    border: InputBorder.none,
                    prefixIcon: IconButton(
                      icon: Icon(
                        _obscurePassword
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: AppColors.grey,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscurePassword = !_obscurePassword;
                        });
                      },
                    ),
                    suffixIcon: const Icon(
                      Icons.lock_open,
                      color: AppColors.mediumPrimary,
                    ),
                  ),
                ),
              ),

              SizedBox(height: 120.h),

              /// Next Button
              CustomMainButton(
                text: 'تأكيد',
                onPressed: () {
                  showDialog(
                    context: context,
                    builder:
                        (_) => const SuccessDialog(
                          message: 'تم إعادة تعيين كلمة المرور بنجاح',
                        ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
