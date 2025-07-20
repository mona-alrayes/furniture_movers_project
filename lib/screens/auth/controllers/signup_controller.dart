import 'package:flutter/material.dart';

class SignUpController {
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  bool validateForm() {
    return formKey.currentState?.validate() ?? false;
  }

  bool passwordsMatch() {
    return passwordController.text == confirmPasswordController.text;
  }

  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
  }
}
