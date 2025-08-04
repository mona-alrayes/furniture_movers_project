import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furniture_movers_project/core/theme/colors.dart';
import 'package:furniture_movers_project/screens/furniture_moving/worker_model.dart';
import 'package:furniture_movers_project/screens/home/controllers/user_controller.dart';
import 'package:furniture_movers_project/screens/home/wedgit/custom_appar.dart';
import 'package:furniture_movers_project/screens/home/wedgit/custom_searchbar .dart';
import 'package:furniture_movers_project/screens/home/wedgit/custom_title.dart';
import 'package:furniture_movers_project/screens/home/wedgit/service.dart';
import 'package:furniture_movers_project/screens/home/wedgit/slidar.dart';
import 'package:furniture_movers_project/screens/home/wedgit/worker_home.dart';

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

  final List<WorkerModel> workers = [
    WorkerModel(
      name: "محمد حسن احمد",
      jobTitle: "مهندس كهربائي",
      imagePath: "assets/images/005.JPG",
      rating: 4.5,
    ),
    WorkerModel(
      name: "علي عبدالله سعيد",
      jobTitle: "نقل أثاث",
      imagePath: "assets/images/005.JPG",
      rating: 3.8,
    ),
    WorkerModel(
      name: "احمد سليمان",
      jobTitle: "نجار محترف",
      imagePath: "assets/images/005.JPG",
      rating: 5.0,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: const CustomAppBarHome(),
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomSearchBar(),
              SizedBox(height: 10.h),
              CustomTitle(title: "العروض الخاصة"),
              SizedBox(height: 10.h),
              ServicesSlider(),
              SizedBox(height: 20.h),
              CustomTitle(title: "الخدمات الأساسية"),
              SizedBox(height: 10.h),
              ServicesList(),
              SizedBox(height: 20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomTitle(title: "المميزون اليوم"),
                  Text(
                    "عرض المزيد",
                    style: TextStyle(fontSize: 16.sp, color: AppColors.primary),
                  ),
                ],
              ),
              SpecialWorkersList(workers: workers),
            ],
          ),
        ),
      ),
    );
  }
}
