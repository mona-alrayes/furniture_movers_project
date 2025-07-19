import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../theme/colors.dart';

class CustomPasswordField extends StatelessWidget {
  final TextEditingController controller;
  final bool obscureText;
  final VoidCallback onToggle;
  final String? Function(String?) validator;

  const CustomPasswordField({
    Key? key,
    required this.controller,
    required this.obscureText,
    required this.onToggle,
    required this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48.h,
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        validator: validator,
        textAlign: TextAlign.right,
        style: const TextStyle(color: AppColors.grey),
        decoration: InputDecoration(
          filled: true,
          fillColor: AppColors.veryLightGrey,
          border: InputBorder.none,
          prefixIcon: IconButton(
            icon: Icon(
              obscureText ? Icons.visibility_off : Icons.visibility,
              color: AppColors.grey,
            ),
            onPressed: onToggle,
          ),
          suffixIcon:
              const Icon(Icons.lock_open, color: AppColors.mediumPrimary),
        ),
      ),
    );
  }
}
