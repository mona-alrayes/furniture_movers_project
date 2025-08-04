import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furniture_movers_project/core/theme/colors.dart';
import 'package:furniture_movers_project/screens/furniture_moving/worker_model.dart';
import 'package:furniture_movers_project/screens/furniture_moving/worker_service_special.dart';
import 'package:furniture_movers_project/screens/home/controllers/user_controller.dart';
import 'package:furniture_movers_project/screens/home/wedgit/custom_appar.dart';
import 'package:furniture_movers_project/screens/home/wedgit/custom_searchbar .dart';
import 'package:furniture_movers_project/screens/home/wedgit/custom_title.dart';
import 'package:furniture_movers_project/screens/home/wedgit/service.dart';
import 'package:furniture_movers_project/screens/home/wedgit/slidar.dart';
import 'package:furniture_movers_project/screens/home/wedgit/worker_card.dart'; 

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //final UserController _controller = UserController();
  bool isLoading = true;
  List<WorkerModel> specialWorkers = [];
  String errorMessage = '';

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    try {
      final fetchedWorkers = await fetchWorkersSpeical(); // categoryId = "1"
      setState(() {
        specialWorkers = fetchedWorkers;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        errorMessage = 'فشل تحميل الفنيين: $e';
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar:  CustomAppBarHome(),
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
              SizedBox(height: 12.h),
              if (isLoading)
                const Center(
                  child: CircularProgressIndicator(color: AppColors.primary),
                )
              else if (errorMessage.isNotEmpty)
                Center(child: Text(errorMessage))
              else if (specialWorkers.isEmpty)
                const Center(child: Text("لا يوجد فنيون مميزون حالياً"))
              else
                WorkersList(workers: specialWorkers),
            ],
          ),
        ),
      ),
    );
  }
}
