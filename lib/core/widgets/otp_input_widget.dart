import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';
import '/core/theme/colors.dart';

class OtpInputWidget extends StatelessWidget {
  final OtpFieldController controller;
  final Function(String)? onChanged;
  final Function(String)? onCompleted;

  const OtpInputWidget({
    Key? key,
    required this.controller,
    this.onChanged,
    this.onCompleted,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OTPTextField(
      controller: controller,
      length: 6, // Set to 6 digits
      width: MediaQuery.of(context).size.width,
      keyboardType: TextInputType.numberWithOptions(),
      textFieldAlignment: MainAxisAlignment.spaceAround,
      fieldWidth: 56,
      otpFieldStyle: OtpFieldStyle(
        backgroundColor: AppColors.grey,
        focusBorderColor: AppColors.primary,
        borderColor: Colors.transparent,
        enabledBorderColor: AppColors.primary,
      ),
      fieldStyle: FieldStyle.box,
      outlineBorderRadius: 8,
      style: const TextStyle(fontSize: 17),
      onChanged: onChanged,
      onCompleted: onCompleted,
    );
  }
}
