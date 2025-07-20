import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furniture_movers_project/core/theme/colors.dart';
import 'package:furniture_movers_project/core/theme/fonts.dart';
import 'package:furniture_movers_project/core/widgets/custom_appbar.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({super.key});
  //للروابط الخارجية
  void _launchURL(String url) async {
    final Uri uri = Uri.parse(url);

    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      print('Cannot open link: $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "تواصل بنا"),
      body: Padding(
        padding: EdgeInsets.only(top: 24.h, right: 24.w, left: 24.w),
        child: Align(
          alignment: Alignment.topRight,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              // قسم تويتر
              _buildContactRow(
                iconWidget: Image.asset(
                  'assets/icons/twitter.png',
                  width: 32.w,
                  height: 32.h,
                ),
                text: '@amal',
                onTap: () => _launchURL('https://twitter.com/amal'),
              ),
              SizedBox(height: 20.h),

              // قسم الواتساب
              _buildContactRow(
                iconWidget: Image.asset(
                  'assets/icons/whatsap.png',
                  width: 32.w,
                  height: 32.h,
                ),
                text: '00201284738374774',
                onTap: () => _launchURL('https://wa.me/00201284738374774'),
              ),
              SizedBox(height: 20.h),

              //قسم البريد الإلكتروني
              _buildContactRow(
                iconWidget: Image.asset(
                  'assets/icons/email.png',
                  width: 32.w,
                  height: 32.h,
                ),
                text: 'alamal@gmail.com',
                onTap: () => _launchURL('mailto:alamal@gmail.com'),
              ),
            ],
          ),
        ),
      ),
    );
  }
//تابع ل محتويات الاسطر
  Widget _buildContactRow({
    required Widget iconWidget,
    required String text,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(width: 1.5, color: AppColors.primary),
              ),
            ),
            child: Text(
              text,
              style: AppFonts.contactUsFormFont,
              textAlign: TextAlign.right,
            ),
          ),
          SizedBox(width: 12.w),
          iconWidget,
        ],
      ),
    );
  }
}
