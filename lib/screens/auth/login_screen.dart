import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import '/core/theme/colors.dart';
import '/core/widgets/custom_main_button.dart';
import '../../core/theme/fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 80.h, left: 24.w, right: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  'مرحبًا بعودتك مجدداً ...',
                  style: GoogleFonts.almarai(
                    fontSize: 28.sp,
                    fontWeight: FontWeight.w800,
                    color: AppColors.black,
                  ),
                  textDirection: TextDirection.rtl,
                ),
              ),
              SizedBox(height: 16.h),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  'فضلاً قم بتسجيل الدخول إلى حسابك',
                  style: GoogleFonts.poppins(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.grey,
                  ),
                  textDirection: TextDirection.rtl,
                ),
              ),
              SizedBox(height: 40.h),
              Center(
                child: Image.asset(
                  'assets/images/login-image.png',
                  width: 279.w,
                  height: 214.h,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 32.h),

              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  'رقم التلفون',
                  style: GoogleFonts.almarai(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w700,
                    color: AppColors.black,
                  ),
                ),
              ),
              SizedBox(height: 16.h),

              ///  Phone Input
              SizedBox(
                height: 60.h,
                child: IntlPhoneField(
                  controller: TextEditingController(),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: AppColors.veryLightGrey, // Use your defined grey
                    border: InputBorder.none,
                  ),
                  initialCountryCode: 'SA',
                  onChanged: (phone) {
                    _phoneController.text = phone.completeNumber;
                  },
                  textAlign: TextAlign.left,
                  showCountryFlag: true,
                ),
              ),
              SizedBox(height: 24.h),

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
                  controller: _passwordController,
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
                    suffixIcon: Padding(
                      padding: EdgeInsets.all(11.0),
                      child: SvgPicture.asset('assets/icons/lock-open.svg'),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 8.h),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, '/forgetPassword');
                },
                child: Text(
                  'نسيت كلمة المرور؟',
                  style: GoogleFonts.almarai(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w700,
                    color: AppColors.grey,
                    decoration: TextDecoration.none,
                  ),
                ),
              ),

              SizedBox(height: 96.h),

              ///  Login Button
              CustomMainButton(
                text: 'تسجيل الدخول',
                onPressed: () {
                  if (_phoneController.text.isNotEmpty &&
                      _passwordController.text.isNotEmpty) {
                    Navigator.pushReplacementNamed(context, '/home');
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('يرجى إدخال رقم الهاتف وكلمة المرور'),
                      ),
                    );
                  }
                },
              ),
              SizedBox(height: 16.h),
              Align(
                alignment: Alignment.center,
                child: Wrap(
                  alignment: WrapAlignment.center,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, '/signUp');
                      },
                      child: Text(
                        'إنشاء جديد',
                        style: GoogleFonts.almarai(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w700,
                          color: AppColors.primary, // or any other color
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                    Text(
                      ' ليس لديك حساب؟ ',
                      style: GoogleFonts.almarai(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w700,
                        color: AppColors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
