import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furniture_movers_project/core/theme/colors.dart';
import 'package:furniture_movers_project/core/theme/fonts.dart';
import 'package:furniture_movers_project/core/widgets/custom_appbar.dart'; // تأكد من المسار الصحيح

class LanguageSelectionScreen extends StatefulWidget {
  const LanguageSelectionScreen({super.key});

  @override
  State<LanguageSelectionScreen> createState() => _LanguageSelectionScreenState();
}

class _LanguageSelectionScreenState extends State<LanguageSelectionScreen> {
  String _selectedLanguage = 'ar'; // 'ar' أو 'en' (UI فقط)

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        title: 'لغة التطبيق',
        onBack: () => Navigator.of(context).pop(_selectedLanguage), // يرجع اللغة المختارة
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 24.h),
            _buildLanguageOption('en', 'English', 'assets/icons/us.png'),
            SizedBox(height: 16.h),
            _buildLanguageOption('ar', 'عربي', 'assets/icons/eg.png'),
          ],
        ),
      ),
    );
  }

  Widget _buildLanguageOption(String langCode, String label, String flagAsset) {
    final bool isSelected = _selectedLanguage == langCode;
    return InkWell(
      onTap: () => setState(() => _selectedLanguage = langCode),
      child: Container(
        height: 72.h,
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFFFFFF) : AppColors.white,
          border: Border.all(
            color: isSelected ? const Color(0xFF4B75CB) : AppColors.regularGrey,
            width: 1.w,
          ),
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Row(
          children: [
            _buildRadio(isSelected),
            SizedBox(width: 16.w),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Flexible(
                    child: Text(
                      label,
                      style: AppFonts.englishLa,
                      textAlign: TextAlign.right,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  SizedBox(width: 12.w),
                  Image.asset(
                    flagAsset,
                    width: 24.w,
                    height: 18.h,
                    fit: BoxFit.cover,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRadio(bool selected) {
    return Container(
      width: 20.r,
      height: 20.r,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: selected ? const Color(0xFF4B75CB) : AppColors.grey,
          width: 2.w,
        ),
      ),
      child: Center(
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 180),
          width: selected ? 12.r : 0,
          height: selected ? 12.r : 0,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: selected ? const Color(0xFF4B75CB) : AppColors.white,
          ),
        ),
      ),
    );
  }
}
