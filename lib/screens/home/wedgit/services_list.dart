import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:furniture_movers_project/controllers/services_controller.dart';
import 'package:furniture_movers_project/models/service_model.dart';
import 'package:furniture_movers_project/screens/furniture_moving/furniture_moving.dart';

class ServicesList extends StatefulWidget {
  @override
  State<ServicesList> createState() => _ServicesListState();
}

class _ServicesListState extends State<ServicesList> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<ServicesController>(context, listen: false).fetchServices();
    });
  }

  void navigateToServicePage(BuildContext context, int serviceId) {
    switch (serviceId) {
      case 1: // افترض أن ID خدمة نقل الأثاث هو 1
        Navigator.of(context).pushNamed('/furnitureMoving');
        break;
      case 2: // صيانة الأجهزة المنزلية
        Navigator.of(context).pushNamed('/serviceDetails');
        break;
      // أضف باقي الخدمات هنا حسب الـ IDs
      default:
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => Scaffold(body: Center(child: Text('الخدمة غير متوفرة'))),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<ServicesController>(context);
    final List<ServiceModel> services = controller.services;

    if (controller.isLoading) {
      return Center(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20.h),
          child: CircularProgressIndicator(),
        ),
      );
    }

    if (services.isEmpty && !controller.isLoading) {
      return Center(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20.h),
          child: Text('لا توجد خدمات متاحة حالياً'),
        ),
      );
    }

    return SizedBox(
      height: 160.h,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.w),
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: services.length,
          separatorBuilder: (_, __) => SizedBox(width: 8.w),
          itemBuilder: (context, index) {
            final service = services[index];
            return InkWell(
              onTap: () => navigateToServicePage(context, service.id),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 40.r,
                    backgroundImage: NetworkImage(service.imageUrl),
                  ),
                  SizedBox(height: 8.h),
                  SizedBox(
                    width: 90.w,
                    child: Text(
                      service.title,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 13.sp),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}