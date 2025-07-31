import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:furniture_movers_project/core/theme/colors.dart';
import 'package:furniture_movers_project/core/theme/fonts.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:furniture_movers_project/screens/chat/chat_list_screen.dart';
import 'package:furniture_movers_project/screens/home/home_screen.dart';
import 'package:furniture_movers_project/screens/favorite/favorite_screen.dart';
import 'package:furniture_movers_project/screens/profile/profile_screen.dart';


class MainLayout extends StatefulWidget {
  final int initialIndex;

  const MainLayout({super.key, this.initialIndex = 0});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  late int _currentIndex;

  final List<Widget> _screens =  [
    HomeScreen(),
    ChatListScreen(),
    FavoritesScreen(),
    ProfileScreen(),
  ];

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
  }

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
      // If not on HomeScreen, navigate to HomeScreen
      if (_currentIndex != 0) {
        setState(() {
          _currentIndex = 0;
        });
        return false; // Prevent default back behavior
      }

      // If already on HomeScreen, show exit confirmation dialog
      return await showDialog<bool>(
        context: context,
        builder: (context) => AlertDialog(
          backgroundColor: Colors.white,
          title: Text(
            'تأكيد الخروج',
            style: AppFonts.appBarFont,
            textDirection: TextDirection.rtl,
          ),
          content: Text(
            'هل تريد الخروج من التطبيق؟',
            style: AppFonts.termCondTitleFormFont,
            textDirection: TextDirection.rtl,
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: Text('إلغاء',
              style: GoogleFonts.almarai(
          fontSize: 12.sp,
          fontWeight: FontWeight.w400,
          color: AppColors.brightBlue,
          ),),),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                SystemNavigator.pop();
              },
              child: Text(
                'نعم',
                style: GoogleFonts.almarai(
          fontSize: 12.sp,
          fontWeight: FontWeight.w400,
          color: AppColors.brightBlue,
          ),),),
          ],
        ),
      ) ?? false;
    },

      child: Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: _screens[_currentIndex],
        bottomNavigationBar: Container(
          height: 88.h,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.blue.withOpacity(0.1),
                blurRadius: 10,
                offset: const Offset(0, -1),
              ),
            ],
          ),
          child: BottomNavigationBar(
            currentIndex: _currentIndex,
            onTap: _onItemTapped,
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.white,
            selectedItemColor: AppColors.primary,
            unselectedItemColor: AppColors.grey,
            selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
            unselectedLabelStyle: TextStyle(fontSize: 12.sp),
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined, size: 24.r),
                activeIcon: Icon(Icons.home, size: 26.r),
                label: 'الرئيسية',
              ),
              BottomNavigationBarItem(
                icon: ColorFiltered(
                  colorFilter: const ColorFilter.mode(
                    Colors.grey,
                    BlendMode.srcIn,
                  ),
                  child: Image.asset(
                    'assets/icons/Chat.png',
                    width: 24.w,
                    height: 24.h,
                  ),
                ),
                activeIcon: ColorFiltered(
                  colorFilter: const ColorFilter.mode(
                    AppColors.primary, // اللون عند التفعيل
                    BlendMode.srcIn,
                  ),
                  child: Image.asset(
                    'assets/icons/Chat.png',
                    width: 24.w,
                    height: 24.h,
                  ),
                ),
                label: 'الشات',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite_border, size: 24.r),
                activeIcon: Icon(Icons.favorite, size: 26.r),
                label: 'المفضلة',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person_outline, size: 24.r),
                activeIcon: Icon(Icons.person, size: 26.r),
                label: 'البروفايل',
              ),
            ],
          ),
        ),
      ),),
    );
  }
}