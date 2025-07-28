import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furniture_movers_project/core/theme/colors.dart';
import 'package:furniture_movers_project/core/theme/fonts.dart';
import 'controllers/profile_controller.dart';
import 'models/profile_action.dart';
import 'app_mode_screen.dart';
import 'app_language_screen.dart';
import 'about_app_screen.dart';
import 'contact_us_screen.dart';
import 'terms_conditions_screen.dart';
import 'package:furniture_movers_project/screens/auth/reset_password_screen.dart';
import 'models/error_log_out.dart';
import 'widgets/profile_header.dart';
import 'widgets/profile_tile.dart';
import 'widgets/logout_button.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late final ProfileController controller;
  late final VoidCallback _controllerListener;

  //int _currentIndex = 3;

  @override
  void initState() {
    super.initState();
    controller = ProfileController();
    _controllerListener = () {
      if (mounted) setState(() {});
    };
    controller.addListener(_controllerListener);
    controller.init();
  }

  @override
  void dispose() {
    controller.removeListener(_controllerListener);
    controller.dispose();
    super.dispose();
  }

  // ---------------------------------------------------------------------------
  // الملاحة إلى شاشة اختيار اللغة (UI فقط)
  // ---------------------------------------------------------------------------
  Future<void> _openLanguageScreen() async {
    await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => const LanguageSelectionScreen(),
      ),
    );
    // لاحقاً: استقبل قيمة اللغة المختارة وحدث الـ Locale.
  }

  Future<void> _openModeScreen() async {
    await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => const AppModeScreen(),
      ),
    );
    // لاحقاً: استقبل قيمة اللغة المختارة وحدث الـ Locale.
  }

  void _showLogoutDialog() {
    showDialog(
      context: context,
      builder: (_) => const LogoutDialog(),
    );
  }

  void _openAboutAppScreen() {
    showDialog(
      context: context,
      builder: (_) => const AboutAppScreen(),
    );
  }

  void _openContactUsScreen() {
    showDialog(
      context: context,
      builder: (_) => const ContactUsScreen(),
    );
  }

  void _openTermsConditionsScreen() {
    showDialog(
      context: context,
      builder: (_) => const TermsConditionsScreen(),
    );
  }

  void _openRestPasswordScreen() {
    showDialog(
      context: context,
      builder: (_) => const RestPasswordScreen(),
    );
  }

  // ---------------------------------------------------------------------------
  // توزيع الأفعال حسب ProfileAction
  // ---------------------------------------------------------------------------
  void _handleAction(ProfileAction action) {
    switch (action) {
      case ProfileAction.changePhone:
        controller.changePhone();
        break;
      case ProfileAction.changePassword:
        _openRestPasswordScreen();
        break;
      case ProfileAction.changeLanguage:
        _openLanguageScreen(); // الملاحة من الـ UI
        break;
      case ProfileAction.toggleAppMode:
        _openModeScreen();
        break;
      case ProfileAction.contactUs:
        _openContactUsScreen();
        break;
      case ProfileAction.showTerms:
        _openTermsConditionsScreen();
        break;
      case ProfileAction.showAbout:
        _openAboutAppScreen();
        break;
      case ProfileAction.logout:
        _showLogoutDialog();
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final isLoading = controller.isLoading;

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.regularGrey, width: 1.w),
            ),
            child: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: Colors.white,
              elevation: 0,
              centerTitle: true,
              title: Text('الملف الشخصي',
                  style: AppFonts.appBarFont.copyWith(fontSize: 20.sp)),
              iconTheme: const IconThemeData(color: Colors.black),
            ),
          ),
        ),
        body: isLoading
            ? const Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 8.h),
              ProfileHeader(
                profileImage: controller.profileImage,
                name: controller.name,
                phone: controller.phone,
                onEdit: controller.pickImage,
              ),
              SizedBox(height: 24.h),
              ...controller.sections.map((section) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(16.w, 18.h, 16.w, 6.h),
                      child: Text(section.title,
                          style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold)),
                    ),
                    ...section.items.map((item) =>
                        ProfileTile(
                          icon: item.iconPath,
                          text: item.label,
                          onTap: () => _handleAction(item.action),
                        )),
                  ],
                );
              }).toList(),
              SizedBox(height: 8.h),
              LogoutButton(onTap: () => _handleAction(ProfileAction.logout)),
              SizedBox(height: 25.h),
            ],
          ),
        ),

        //bottomNavigationBar: _buildBottomNavigationBar(),
      ),
    );
  }
}

