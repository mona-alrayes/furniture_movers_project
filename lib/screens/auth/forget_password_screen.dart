import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import '/core/theme/colors.dart';
import '/core/widgets/custom_main_button.dart';
import '../../core/widgets/custom_appbar.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  String? _phoneNumber;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: CustomAppBar(title: 'نسيت كلمة المرور'),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.asset(
                  'assets/images/forgetpassowrd.png',
                  width: 380.w,
                  height: 283.15.h,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 48.h),

              /// Label
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  'رقم التلفون',
                  style: GoogleFonts.almarai(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w700,
                    color: AppColors.black,
                  ),
                  textDirection: TextDirection.rtl,
                ),
              ),
              SizedBox(height: 16.h),

              /// Phone Input
              SizedBox(
                height: 60.h,
                child: IntlPhoneField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: AppColors.veryLightGrey,
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    contentPadding: EdgeInsets.symmetric(horizontal: 12.w),
                  ),
                  initialCountryCode: 'SA',
                  onChanged: (phone) {
                    _phoneNumber = phone.completeNumber;
                  },
                  textAlign: TextAlign.left,
                  showCountryFlag: true,
                ),
              ),
              SizedBox(height: 232.h),

              /// Next Button
              CustomMainButton(
                text: 'التالي',
                onPressed: () {
                  if (_phoneNumber == null || _phoneNumber!.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'يرجى إدخال رقم الهاتف',
                          style: GoogleFonts.almarai(),
                          textAlign: TextAlign.right,
                        ),
                        backgroundColor: Colors.black,
                      ),
                    );
                    return;
                  }
                  // Navigate to next screen here
                   Navigator.pushNamed(context, '/otp');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
