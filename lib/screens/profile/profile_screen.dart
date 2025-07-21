import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'controllers/profile_controller.dart';
import 'models/profile_action.dart';
import 'package:furniture_movers_project/core/theme/colors.dart';
import 'package:furniture_movers_project/core/theme/fonts.dart';
import 'app_language_screen.dart';
import 'app_mode_screen.dart';
import 'models/error_log_out.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late final ProfileController controller;
  late final VoidCallback _controllerListener; // للاستخدام في removeListener
  int _currentIndex = 3;

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


  // ---------------------------------------------------------------------------
  // توزيع الأفعال حسب ProfileAction
  // ---------------------------------------------------------------------------
  void _handleAction(ProfileAction action) {
    switch (action) {
      case ProfileAction.changePhone:
        controller.changePhone();
        break;
      case ProfileAction.changePassword:
        controller.changePassword();
        break;
      case ProfileAction.changeLanguage:
        _openLanguageScreen(); // الملاحة من الـ UI
        break;
      case ProfileAction.toggleAppMode:
        _openModeScreen();
        break;
      case ProfileAction.contactUs:
        controller.contactUs();
        break;
      case ProfileAction.showTerms:
        controller.showTerms();
        break;
      case ProfileAction.showAbout:
        controller.showAbout();
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
              title: Text('الملف الشخصي', style: AppFonts.appBarFont.copyWith(fontSize: 20.sp)),
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
              _buildProfileHeader(),
              SizedBox(height: 24.h),
              ...controller.sections.map(_buildSection).toList(),
              SizedBox(height: 8.h),
              _logoutButton(),
              SizedBox(height: 25.h),
            ],
          ),
        ),
        //bottomNavigationBar: _buildBottomNavigationBar(),
      ),
    );
  }

  Widget _buildProfileHeader() {
    return Column(
      children: [
        Stack(
          alignment: Alignment.bottomLeft,
          children: [
            CircleAvatar(
              radius: 56.r,
              backgroundImage: controller.profileImage != null
                  ? FileImage(controller.profileImage!)
                  : const AssetImage('assets/images/default_user.jpg') as ImageProvider,
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: GestureDetector(
                onTap: () => controller.pickImage(),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 2.w),
                  ),
                  padding: EdgeInsets.all(6.w),
                  child: Icon(Icons.edit, color: Colors.white, size: 20.sp),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 12.h),
        Text(controller.name, style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w700)),
        SizedBox(height: 4.h),
        Text(controller.phone, style: TextStyle(fontSize: 14.sp, color: Colors.grey)),
      ],
    );
  }

  Widget _buildSection(ProfileMenuSection section) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(16.w, 18.h, 16.w, 6.h),
          child: Text(section.title, style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold)),
        ),
        ...section.items.map(
              (item) => _profileTile(
            icon: item.iconPath,
            text: item.label,
            onTap: () => _handleAction(item.action),
          ),
        ),
      ],
    );
  }

  Widget _profileTile({required String icon, required String text, required VoidCallback onTap}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(color: AppColors.regularGrey, width: 1.w),
        ),
        child: ListTile(
          leading: Image.asset(icon, width: 24.w, height: 24.w),
          title: Text(text, style: TextStyle(fontSize: 16.sp)),
          trailing: Image.asset(
            'assets/icons/chevron-left.png',
            width: 24.w,
            height: 24.w,
            color: AppColors.primary,
          ),
          onTap: onTap,
        ),
      ),
    );
  }

  Widget _logoutButton() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(color: AppColors.regularGrey, width: 1.w),
        ),
        child: ListTile(
          leading: Image.asset(
            'assets/icons/logout.png',
            width: 24.w,
            height: 24.w,
            color: Colors.red,
          ),
          title: Text(
            'تسجيل خروج',
            style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold, fontSize: 16.sp),
          ),
          onTap: () => _handleAction(ProfileAction.logout),
        ),
      ),
    );
  }

  // Widget _buildBottomNavigationBar() {
  //   return BottomNavigationBar(
  //     backgroundColor: AppColors.white,
  //     type: BottomNavigationBarType.fixed,
  //     currentIndex: _currentIndex,
  //     onTap: (index) {
  //       setState(() => _currentIndex = index);
  //     },
  //     selectedItemColor: Colors.blue,
  //     unselectedItemColor: Colors.grey,
  //     selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 12.sp),
  //     unselectedLabelStyle: TextStyle(fontSize: 11.sp),
  //     items: const [
  //       BottomNavigationBarItem(icon: Icon(Icons.home_outlined), activeIcon: Icon(Icons.home), label: 'الرئيسية'),
  //       BottomNavigationBarItem(icon: Icon(Icons.chat_bubble_outline_outlined), activeIcon: Icon(Icons.receipt_long), label: 'الشات'),
  //       BottomNavigationBarItem(icon: Icon(Icons.favorite_border), activeIcon: Icon(Icons.favorite), label: 'المفضلة'),
  //       BottomNavigationBarItem(icon: Icon(Icons.person_outline), activeIcon: Icon(Icons.person), label: 'البروفايل'),
  //     ],
  //   );
  // }
}