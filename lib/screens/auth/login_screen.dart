import 'package:flutter/material.dart';
import 'package:furniture_movers_project/core/theme/fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '/core/theme/colors.dart';
import '/core/widgets/custom_main_button.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/services.dart';
import 'package:furniture_movers_project/screens/auth/loading_screen.dart';
import 'package:furniture_movers_project/core/widgets/main_layout.dart';
import 'package:furniture_movers_project/screens/auth/controllers/login_controller.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final LoginInController _controller = LoginInController();
  bool _obscurePassword = true;
  bool _isLoading = false;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        SystemNavigator.pop(); // Exit app on back button
        return false;
      },
      child: Stack(
        children: [
          Scaffold(
            backgroundColor: AppColors.white,
            body: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(top: 80.h, left: 24.w, right: 24.w),
                child: Form(
                  key: _controller.formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          'مرحبًا بعودتك مجدداً ...',
                          style: AppFonts.signInMainHeaderFont,
                          textDirection: TextDirection.rtl,
                        ),
                      ),
                      SizedBox(height: 16.h),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          'فضلاً قم بتسجيل الدخول إلى حسابك',
                          style: AppFonts.signInSecondaryHeaderFont,
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
                          'البريد الإلكتروني',
                          style: AppFonts.signMainFormFont,
                        ),
                      ),
                      SizedBox(height: 16.h),
                      SizedBox(
                        height: 48.h,
                        child: TextFormField(
                          controller: _controller.emailController,
                          textAlign: TextAlign.right,
                          style: TextStyle(color: AppColors.grey),
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: AppColors.veryLightGrey,
                            border: InputBorder.none,
                            suffixIcon: Padding(
                              padding: EdgeInsets.all(11.0),
                              child: Icon(
                                Icons.email,
                                color: AppColors.mediumPrimary,
                              ),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'يرجى إدخال البريد الإلكتروني';
                            }
                            final emailRegex =
                                RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$');
                            if (!emailRegex.hasMatch(value.trim())) {
                              return 'صيغة البريد الإلكتروني غير صحيحة';
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(height: 24.h),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          'كلمة المرور',
                          style: AppFonts.signMainFormFont,
                        ),
                      ),
                      SizedBox(height: 16.h),
                      SizedBox(
                        height: 48.h,
                        child: TextFormField(
                          controller: _controller.passwordController,
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
                              child: SvgPicture.asset(
                                  'assets/icons/lock-open.svg'),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'يرجى إدخال كلمة المرور';
                            }
                            if (value.trim().length < 6) {
                              return 'كلمة المرور يجب أن تكون 6 أحرف على الأقل';
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(height: 8.h),
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, '/forgetPassword');
                        },
                        child: Text(
                          'نسيت كلمة المرور؟',
                          style: AppFonts.signSecondaryFormFont,
                        ),
                      ),
                      SizedBox(height: 96.h),
                      CustomMainButton(
                        text: 'تسجيل الدخول',
                        onPressed: () async {
                          if (_controller.formKey.currentState!.validate()) {
                            setState(() => _isLoading = true);
                            final result = await _controller.LoginIn();
                            setState(() => _isLoading = false);

                            if (result['success']) {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => LoadingScreen(
                                    message: 'تسجيل الدخول',
                                    targetScreen: const MainLayout(),
                                  ),
                                ),
                              );
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text(result['message'])),
                              );
                            }
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                  'يرجى إدخال البريد الإلكتروني وكلمة المرور',
                                ),
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
                                style: AppFonts.contactUsFormFont,
                              ),
                            ),
                            Text(
                              ' ليس لديك حساب؟ ',
                              style: AppFonts.signSecondaryFormFont,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          /// Loading overlay
          if (_isLoading)
            Container(
              color: Colors.black.withOpacity(0.3),
              child: const Center(
                child: CircularProgressIndicator(
                  color: AppColors.primary,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
