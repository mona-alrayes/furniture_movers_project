import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furniture_movers_project/core/theme/colors.dart';
import 'package:furniture_movers_project/core/widgets/custom_appbar.dart';
import 'package:furniture_movers_project/core/widgets/main_layout.dart';
import 'package:furniture_movers_project/screens/furniture_moving/worker_model.dart';
import 'package:furniture_movers_project/screens/furniture_moving/worker_service.dart' as WorkerService;
import 'package:furniture_movers_project/screens/home/wedgit/custom_title.dart';
import 'package:furniture_movers_project/screens/home/wedgit/worker_card.dart';

class FurnitureMoving extends StatefulWidget {
  const FurnitureMoving({super.key});

  @override
  State<FurnitureMoving> createState() => _FurnitureMovingState();
}

class _FurnitureMovingState extends State<FurnitureMoving> {
  late String categoryId;
  late String title;
  late String imageUrl;
  late Future<List<WorkerModel>> futureWorkers;
  bool _isInitialized = false;

  void _handleBackNavigation() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => MainLayout(initialIndex: 0)),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Retrieve arguments only once
    if (!_isInitialized) {
      final args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
      categoryId = args['id'];
      title = args['title'];
      imageUrl = args['image_url'];
      futureWorkers = WorkerService.fetchWorkers(categoryId);
      _isInitialized = true;
    }

    return WillPopScope(
      onWillPop: () async {
        _handleBackNavigation();
        return false;
      },
      child: Scaffold(
        appBar: CustomAppBar(title: title, onBack: _handleBackNavigation),
        backgroundColor: Colors.white,
        body: Directionality(
          textDirection: TextDirection.rtl,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // ✅ Fixed: Proper image loading with NetworkImage
                  Container(
                    width: double.infinity,
                    height: 300.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.r),
                      image: DecorationImage(
                        image: NetworkImage(imageUrl),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  SizedBox(height: 12.h),
                  CustomTitle(title: "الفنيون الموجودون في الخدمة"),
                  SizedBox(height: 12.h),
                  FutureBuilder<List<WorkerModel>>(
                    future: futureWorkers,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator(
                            color: AppColors.primary,
                          ),
                        );
                      } else if (snapshot.hasError) {
                        return Center(
                          child: Text('حدث خطأ: ${snapshot.error}'),
                        );
                      } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                        return const Center(
                          child: Text('لا يوجد فنيون حالياً'),
                        );
                      }
                      return WorkersList(workers: snapshot.data!);
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
