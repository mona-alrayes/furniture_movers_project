import 'package:flutter/material.dart';
import 'package:furniture_movers_project/core/widgets/custom_password_field.dart';
import 'package:furniture_movers_project/core/widgets/custom_label.dart';
import 'package:furniture_movers_project/core/widgets/custom_text_field.dart';
import 'package:furniture_movers_project/core/widgets/custom_main_button.dart';
import 'package:furniture_movers_project/core/theme/colors.dart';
import 'package:furniture_movers_project/core/theme/fonts.dart';
import 'package:furniture_movers_project/screens/auth/controllers/signup_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furniture_movers_project/screens/auth/login_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final SignUpController _controller = SignUpController();
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _submitForm() async {
    final isValid = _controller.validateForm();

    if (!isValid) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('يرجى تعبئة جميع الحقول بشكل صحيح')),
      );
      return;
    }

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => const Center(child: CircularProgressIndicator(color: AppColors.primary,)),
    );

    final success = await _controller.signUpUser();
    Navigator.pop(context); // remove loading

    if (success) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('فشل التسجيل. حاول مرة أخرى.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 92.h, left: 24.w, right: 24.w),
          child: Form(
            key: _controller.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    'إنشاء حساب',
                    style: AppFonts.signInMainHeaderFont,
                    textDirection: TextDirection.rtl,
                  ),
                ),
                SizedBox(height: 16.h),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text.rich(
                    TextSpan(
                      text: '.مرحبًا بك في ',
                      style: AppFonts.signInSecondaryHeaderFont,
                      children: [
                        TextSpan(
                          text: 'خدماتك',
                          style: AppFonts.signInServiceFont,
                        ),
                        const TextSpan(text: ' فلنقم بإنشاء حساب معًا '),
                      ],
                    ),
                    textDirection: TextDirection.rtl,
                  ),
                ),
                SizedBox(height: 24.h),

                /// Name
                CustomLabel(text: 'الاسم'),
                SizedBox(height: 16.h),
                CustomTextField(
                  controller: _controller.nameController,
                  hintText: 'محمد حسن',
                  icon: Icons.person_2_outlined,
                  validator: (value) =>
                      value == null || value.isEmpty ? 'الرجاء إدخال الاسم' : null,
                ),

                SizedBox(height: 24.h),

                /// Email
                CustomLabel(text: 'البريد الإلكتروني'),
                SizedBox(height: 16.h),
                CustomTextField(
                  controller: _controller.emailController,
                  hintText: 'example@example.com',
                  icon: Icons.email_outlined,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'يرجى إدخال البريد الإلكتروني';
                    }
                    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
                    if (!emailRegex.hasMatch(value)) {
                      return 'يرجى إدخال بريد إلكتروني صحيح';
                    }
                    return null;
                  },
                ),

                SizedBox(height: 24.h),

                /// Password
                CustomLabel(text: 'كلمة المرور'),
                SizedBox(height: 16.h),
                CustomPasswordField(
                  controller: _controller.passwordController,
                  obscureText: _obscurePassword,
                  onToggle: () {
                    setState(() {
                      _obscurePassword = !_obscurePassword;
                    });
                  },
                  validator: (value) => value == null || value.length < 6
                      ? 'كلمة المرور يجب أن تكون 6 أحرف أو أكثر'
                      : null,
                ),

                SizedBox(height: 24.h),

                /// Confirm Password
                CustomLabel(text: 'تأكيد كلمة المرور'),
                SizedBox(height: 16.h),
                CustomPasswordField(
                  controller: _controller.confirmPasswordController,
                  obscureText: _obscureConfirmPassword,
                  onToggle: () {
                    setState(() {
                      _obscureConfirmPassword = !_obscureConfirmPassword;
                    });
                  },
                  validator: (value) =>
                      value != _controller.passwordController.text
                          ? 'كلمة المرور غير متطابقة'
                          : null,
                ),

                SizedBox(height: 120.h),

                /// Button
                CustomMainButton(text: 'إنشاء جديد', onPressed: _submitForm),
                SizedBox(height: 16.h),

                Align(
                  alignment: Alignment.center,
                  child: Wrap(
                    alignment: WrapAlignment.center,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pushReplacementNamed(context, '/login');
                        },
                        child: Text(
                          'تسجيل الدخول',
                          style: AppFonts.accountLoginLink,
                        ),
                      ),
                      Text(
                        'لديك حساب مسبقا ؟ ',
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
    );
  }
}
