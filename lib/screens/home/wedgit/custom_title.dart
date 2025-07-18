import 'package:flutter/material.dart';
import 'package:furniture_movers_project/core/theme/colors.dart';

class CustomTitle extends StatelessWidget {
  final String Title;
  const CustomTitle({super.key, required this.Title});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Text(
        Title,
        style: TextStyle(
          fontSize: 20,
          color: AppColors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
