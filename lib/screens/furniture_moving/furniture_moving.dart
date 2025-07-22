import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:furniture_movers_project/core/theme/colors.dart';
import 'package:furniture_movers_project/core/widgets/custom_appbar.dart';
import 'package:furniture_movers_project/screens/home/wedgit/custom_title.dart';
import 'package:furniture_movers_project/screens/home/wedgit/worker_card.dart';

class FurnitureMoving extends StatefulWidget {
  const FurnitureMoving({super.key});

  @override
  State<FurnitureMoving> createState() => _FurnitureMovingState();
}

class _FurnitureMovingState extends State<FurnitureMoving> {
  final List<Worker> workers = [
    Worker(
      name: "محمد حسن احمد",
      jobTitle: "مهندس كهربائي",
      imagePath: "assets/images/005.JPG",
      rating: 4.5,
    ),
    Worker(
      name: "علي عبدالله سعيد",
      jobTitle: "نقل أثاث",
      imagePath: "assets/images/005.JPG",
      rating: 3.8,
    ),
    Worker(
      name: "احمد سليمان",
      jobTitle: "نجار محترف",
      imagePath: "assets/images/005.JPG",
      rating: 5.0,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "نقل أثاث"),
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
                WorkersList(workers: workers),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
