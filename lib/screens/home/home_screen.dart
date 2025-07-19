import 'package:flutter/material.dart';
import 'package:furniture_movers_project/core/theme/colors.dart';
import 'package:furniture_movers_project/screens/home/controllers/user_controller.dart';
import 'package:furniture_movers_project/screens/home/wedgit/custom_appar.dart';
import 'package:furniture_movers_project/screens/home/wedgit/custom_searchbar%20.dart';
import 'package:furniture_movers_project/screens/home/wedgit/custom_title.dart';
import 'package:furniture_movers_project/screens/home/wedgit/service.dart';
import 'package:furniture_movers_project/screens/home/wedgit/slidar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final UserController _controller = UserController();
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadUserData();
  }

  Future<void> loadUserData() async {
    // await _controller.fetchUserData();
    setState(() {
      isLoading = false;
    });
  }

  int _currentIndex = 0;
  final List<Widget> _screens = [HomeScreen()];
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
        backgroundColor: Colors.white,
        appBar: CustomAppBar(),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomSearchBar(),
              CustomTitle(Title: "العروض  الخاصة"),
              SizedBox(height: 10),
              ServicesSlider(),
              CustomTitle(Title: "الخدمات الأساسية"),
              ServicesList(),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomTitle(Title: "المميزون اليوم"),
                  Text(
                    "عرض المزيد",
                    style: TextStyle(fontSize: 18, color: AppColors.primary),
                  ),
                ],
              ),
            ],
          ),
        ),
        bottomNavigationBar: ClipRRect(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(10.0),
            bottomRight: Radius.circular(10.0),
          ),

          child: BottomNavigationBar(
            backgroundColor: AppColors.white,
            type: BottomNavigationBarType.fixed, // لمنع التحريك أو الاختفاء
            currentIndex: _currentIndex,
            onTap: _onItemTapped,
            selectedItemColor: Colors.blue, // لون العنصر النشط
            unselectedItemColor: Colors.grey,
            selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),

            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined),
                activeIcon: Icon(Icons.home), // أيقونة مملوءة عند التحديد
                label: 'الرئيسية',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.receipt_long_outlined),
                activeIcon: Icon(Icons.receipt_long),
                label: 'الطلبات',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite_border),
                activeIcon: Icon(Icons.favorite),
                label: 'المفضلة',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person_outline),
                activeIcon: Icon(Icons.person),
                label: 'البروفايل',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
