import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furniture_movers_project/core/theme/colors.dart';
import 'package:furniture_movers_project/core/widgets/custom_appbar.dart';
import 'package:furniture_movers_project/screens/home/wedgit/custom_title.dart';
import 'package:furniture_movers_project/screens/home/wedgit/worker_card.dart';
import 'package:google_fonts/google_fonts.dart';

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
      name: "  علي عبدالله سعيد",
      jobTitle: " نقل أثاث",
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
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(56.h),
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.white,
              border: Border(
                bottom: BorderSide(color: AppColors.regularGrey, width: 1),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                title: Text(
                  "نقل أثاث",
                  style: GoogleFonts.almarai(fontWeight: FontWeight.w800),
                ),
                centerTitle: true,
                leading: InkWell(
                  onTap: () {
                    Navigator.pushReplacementNamed(context, '/homescreen');
                  },
                  child: Container(
                    padding: EdgeInsets.all(3), // مساحة داخلية حول الأيقونة
                    decoration: BoxDecoration(
                      color: Colors.white, // اختر اللون المناسب للخلفية
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Colors.grey, // لون الحدود الذي تريده
                        width: 1.5, // سماكة الحدود
                      ), // زاوية دائرية
                    ),
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Icon(
                        Icons.arrow_back_ios_new_rounded,
                        color: AppColors.grey,
                        size: 20, // حجم الأيقونة حسب الحاجة
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16.w),
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start, // تبدأ العناصر من اليمين في RTL
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
