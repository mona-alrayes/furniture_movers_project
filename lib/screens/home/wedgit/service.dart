import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cached_network_image/cached_network_image.dart';
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
              return const Center(
                child: CircularProgressIndicator(color: AppColors.primary),
              );
            } else if (snapshot.hasError) {
              return const Center(child: Text('فشل في تحميل البيانات'));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(child: Text('لا توجد خدمات متاحة حالياً'));
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
                    onTap: () => Navigator.pushReplacementNamed(
                      context,
                      '/furnitureMoving',
                      arguments: {
                        'id': service.id.toString(),
                        'title': service.title,
                        'image_url': service.imageUrl,
                      },
                    ),
                    child: Column(
                      children: [
                        ClipOval(
                          child: CachedNetworkImage(
                            imageUrl: service.imageUrl,
                            width: 80.r,
                            height: 80.r,
                            fit: BoxFit.cover,
                            placeholder: (context, url) => Container(
                              width: 80.r,
                              height: 80.r,
                              alignment: Alignment.center,
                              child: const CircularProgressIndicator(color:AppColors.primary),
                            ),
                            errorWidget: (context, url, error) => Container(
                              width: 80.r,
                              height: 80.r,
                              color: AppColors.lightGrey,
                              alignment: Alignment.center,
                              child: const Icon(
                                Icons.image_not_supported,
                                color: AppColors.mediumGrey,
                              ),
                            ),
                          ),
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
