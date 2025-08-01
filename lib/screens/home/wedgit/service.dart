import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furniture_movers_project/core/theme/colors.dart';
import 'package:furniture_movers_project/screens/home/controllers/service_controller.dart';

class ServicesList extends StatefulWidget {
  @override
  State<ServicesList> createState() => _ServicesListState();
}

class _ServicesListState extends State<ServicesList> {
  final ServiceController _controller = ServiceController();
  late Future<List<ServiceModel>> _futureServices;

  @override
  void initState() {
    super.initState();
    _futureServices = _controller.fetchServices();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160.h,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.w),
        child: FutureBuilder<List<ServiceModel>>(
          future: _futureServices,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator(color: AppColors.primary,));
            } else if (snapshot.hasError) {
              return Center(child: Text('فشل في تحميل البيانات'));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return Center(child: Text('لا توجد خدمات متاحة حالياً'));
            }

            final services = snapshot.data!;

            return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: services.length,
              itemBuilder: (context, index) {
                final service = services[index];
                return Padding(
                  padding: EdgeInsets.only(right: 8.w),
                  child: InkWell(
                    onTap: () =>  Navigator.pushReplacementNamed(context, '/furnitureMoving' , arguments: service.id, ),
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
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
