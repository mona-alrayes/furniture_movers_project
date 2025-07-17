import 'package:flutter/material.dart';
import 'package:furniture_movers_project/core/theme/colors.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 16),
      child: Row(
        children: [
          // صندوق البحث
          Expanded(
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Colors.grey, // لون الحدود
                  width: 1, // سماكة الحدود
                ),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: TextField(
                textAlign: TextAlign.right,
                decoration: InputDecoration(
                  icon: Icon(Icons.search, color: Colors.grey),
                  hintText: 'ابحث عن خدمة أو فني',
                  hintStyle: TextStyle(color: Colors.grey),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          // زر الإعدادات الأزرق
          SizedBox(width: 10),
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              color: AppColors.primary, // اللون الأزرق المستخدم
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(
              Icons.tune, // أو Icons.filter_list_alt
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
