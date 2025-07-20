import 'package:flutter/material.dart';
import 'package:furniture_movers_project/core/widgets/custom_appbar.dart';
import 'package:furniture_movers_project/core/widgets/otp_input.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:otp_text_field/otp_field.dart';
import '/core/theme/colors.dart';
import '/core/widgets/custom_main_button.dart';
import '../../core/theme/fonts.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final OtpFieldController otpController = OtpFieldController();
  String enteredOtp = '';

  void handleCompleted(String code) {
    print("Completed OTP: $code");
    enteredOtp = code;
    // You can send the code to the server here
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: CustomAppBar(title: 'التحقق من كود'),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //SizedBox(height: 24.h),
              Align(
                alignment: Alignment.center,
                child: Text(
                  ' لقد أرسلنا رمز التحقق إلى  2101023145321+',
                  style: GoogleFonts.almarai(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.black,
                  ),
                  textDirection: TextDirection.rtl,
                ),
              ),
              SizedBox(height: 24.h),
              Center(
                child: Image.asset(
                  'assets/images/OTP-security-image.png',
                  width: 330.w,
                  height: 254.82.h,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 48.h),

              /// Label
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  'كود التحقق ',
                  style: GoogleFonts.almarai(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w800,
                    color: AppColors.black,
                  ),
                  textDirection: TextDirection.rtl,
                ),
              ),
              SizedBox(height: 16.18.h),

              OtpInputWidget(
                onChanged: (value) {
                  print("OTP Changed: $value");
                  setState(() {
                    enteredOtp = value;
                  });
                },
                onCompleted: handleCompleted,
              ),

              SizedBox(height: 40.h),

              Align(
                alignment: Alignment.center,
                child: Text(
                  'لم تتلق الرمز؟',
                  style: GoogleFonts.almarai(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.grey,
                  ),
                  textDirection: TextDirection.rtl,
                ),
              ),
              SizedBox(height: 12.h),
              Center(
                child: InkWell(
                  onTap: () {},
                  child: Text(
                    ' أعد إرسال الرمز',
                    style: GoogleFonts.almarai(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w700,
                      color: AppColors.primary, // or any other color
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 120.h),

              /// Next Button
              CustomMainButton(
                text: 'التالي',
                onPressed: () {
                  if (enteredOtp.length == 6) {
                    //otpController.clear();
                    Navigator.pushNamed(context, '/restPassword');
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('يرجى إدخال رمز التحقق بالكامل'),
                        duration: Duration(seconds: 4),
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
