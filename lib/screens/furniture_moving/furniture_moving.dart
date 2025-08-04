import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furniture_movers_project/core/widgets/custom_appbar.dart';
import 'package:furniture_movers_project/core/widgets/main_layout.dart';
import 'package:furniture_movers_project/screens/home/home_screen.dart';
import 'package:furniture_movers_project/screens/furniture_moving/worker_model.dart';
import 'package:furniture_movers_project/screens/furniture_moving/worker_service.dart'
    as WorkerService;
import 'package:furniture_movers_project/screens/home/wedgit/custom_title.dart';
import 'package:furniture_movers_project/screens/home/wedgit/worker_card.dart';

class FurnitureMoving extends StatefulWidget {
  final String categoryId;

  const FurnitureMoving({super.key, required this.categoryId});

  @override
  State<FurnitureMoving> createState() => _FurnitureMovingState();
}

class _FurnitureMovingState extends State<FurnitureMoving> {
  late Future<List<WorkerModel>> futureWorkers;

  @override
  void initState() {
    super.initState();
    futureWorkers = WorkerService.fetchWorkers(widget.categoryId);
  }

  void _handleBackNavigation() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => MainLayout(initialIndex: 0),
      ),
    );
  }

  void _navigateToHome() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => const HomeScreen(),
      ),
    );
  }

  @override
    Widget build(BuildContext context) {
      return WillPopScope(
          onWillPop: () async {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => MainLayout(initialIndex: 0),
          ),
        );
        return false;
      },
      child: Scaffold(
      appBar: CustomAppBar(title: "نقل أثاث",
        onBack: _navigateToHome,
      ),
      backgroundColor: Colors.white,
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  height: 300.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.r),
                    image: const DecorationImage(
                      image: AssetImage("assets/images/006.png"),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                SizedBox(height: 12.h),
                CustomTitle(title: "الفنيون الموجودون في الخدمة"),
                FutureBuilder<List<WorkerModel>>(
                  future: futureWorkers,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return Center(child: Text('حدث خطأ: ${snapshot.error}'));
                    } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return const Center(child: Text('لا يوجد فنيون حالياً'));
                    }
                    return WorkersList(workers: snapshot.data!);
                  },
                ),
              ],
            ),
          ),
        ),
      ),),
    );
  }
}
