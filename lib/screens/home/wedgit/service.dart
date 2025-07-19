import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furniture_movers_project/screens/furniture_moving/furniture_moving.dart';

class Service {
  final String title;
  final String imageAsset;

  Service({required this.title, required this.imageAsset});
}

final List<Service> services = [
  Service(title: 'نقل الأثاث', imageAsset: 'assets/images/004.png'),
  Service(title: 'صيانة الأجهزة المنزلية', imageAsset: 'assets/images/003.png'),
  Service(title: 'الدهان والتشطيبات', imageAsset: 'assets/images/002.png'),
  Service(title: 'الأعمال الكهربائية', imageAsset: 'assets/images/001.png'),
  Service(
      title: 'النجارة والديكور الخشبي', imageAsset: 'assets/images/003.png'),
];

class ServicesList extends StatelessWidget {
  void navigateToServicePage(BuildContext context, String title) {
    Widget page;

    switch (title) {
      case 'نقل الأثاث':
        page = FurnitureMoving();
        break;
      // case 'صيانة الأجهزة المنزلية':
      //   page = DeviceMaintenance();
      //   break;
      // case 'الدهان والتشطيبات':
      //   page = PaintingPage();
      //   break;
      // case 'الأعمال الكهربائية':
      //   page = ElectricWorkPage();
      //   break;
      // case 'النجارة والديكور الخشبي':
      //   page = CarpentryPage();
      //   break;
      default:
        page = Scaffold(body: Center(child: Text('الخدمة غير متوفرة')));
    }

    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => page),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160.h,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.w),
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: services.length,
          separatorBuilder: (_, __) => SizedBox(width: 2.w),
          itemBuilder: (context, index) {
            final service = services[index];
            return InkWell(
              onTap: () => navigateToServicePage(context, service.title),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 40.r,
                    backgroundImage: AssetImage(service.imageAsset),
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
