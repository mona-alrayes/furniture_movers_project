import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furniture_movers_project/core/theme/colors.dart';
import 'package:furniture_movers_project/core/theme/fonts.dart';
import 'package:furniture_movers_project/core/widgets/custom_appbar.dart';

class AppModeScreen extends StatefulWidget {
  const AppModeScreen({super.key});

  @override
  State<AppModeScreen> createState() => _AppModeScreenState();
}

class _AppModeScreenState extends State<AppModeScreen> {
  String _selectedMode = 'light'; // 'dark' أو 'light'

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        title: 'مود التطبيق',
        onBack: () => Navigator.of(context).pop(_selectedMode),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 24.h),
            _buildModeOption('dark', 'الوضع المظلم', 'assets/icons/Moon.png'),
            SizedBox(height: 24.h),
            _buildModeOption('light', 'الوضع الفاتح', 'assets/icons/Sun.png'),
          ],
        ),
      ),
    );
  }

  Widget _buildModeOption(String mode, String label, String flagAsset) {
    final bool isSelected = _selectedMode == mode;
    return InkWell(
      onTap: () => setState(() => _selectedMode = mode),
      child: Container(
        height: 60.h,
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        decoration: BoxDecoration(
          color: AppColors.white,
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
                      style: AppFonts.englishLa.copyWith(
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
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
