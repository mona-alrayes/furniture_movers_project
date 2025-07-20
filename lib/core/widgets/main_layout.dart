import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../screens/chat/chat_list_screen.dart';
import '../../screens/home/home_screen.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int _currentIndex = 0;

  final List<Widget> _screens = const [HomeScreen(), ChatListScreen()];

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
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
            selectedItemColor: Colors.blue,
            unselectedItemColor: Colors.grey,
            selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
            unselectedLabelStyle: TextStyle(fontSize: 12.sp),
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined, size: 24.r),
                activeIcon: Icon(Icons.home, size: 26.r),
                label: 'الرئيسية',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  'assets/icons/Frame.svg',
                  width: 24.w,
                  height: 24.h,
                ),
                activeIcon: SvgPicture.asset(
                  'assets/icons/chat_filled.svg',
                  width: 24.w,
                  height: 24.h,
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
      ),
    );
  }
}
