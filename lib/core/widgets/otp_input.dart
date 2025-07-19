import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '/core/theme/colors.dart';

class OtpInputWidget extends StatelessWidget {
  final Function(String)? onChanged;
  final Function(String)? onCompleted;

  const OtpInputWidget({
    Key? key,
    this.onChanged,
    this.onCompleted,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl, // 👈 Force RTL
      child: PinCodeTextField(
        appContext: context,
        length: 6,
        onChanged: onChanged ?? (_) {},
        onCompleted: onCompleted,
        keyboardType: TextInputType.number,
        autoFocus: true,
        pinTheme: PinTheme(
          fieldHeight: 48,
          fieldWidth: 56,
          borderRadius: BorderRadius.circular(8),
          shape: PinCodeFieldShape.box,
          borderWidth: 1.5,
          activeColor: AppColors.primary,
          selectedColor: AppColors.primary,
          inactiveColor: Colors.transparent,
          activeFillColor: AppColors.regularGrey,
          selectedFillColor: AppColors.lightPrimaryGrey,
          inactiveFillColor: AppColors.regularGrey,
          errorBorderColor: AppColors.red,
        ),
        backgroundColor: Colors.transparent,
        enableActiveFill: true,
        textStyle: const TextStyle(fontSize: 17),
      ),
    );
  }
}
