import 'package:flutter/material.dart';

class Service {
  final String title;
  final String imageAsset;

  Service({required this.title, required this.imageAsset});
}

// قائمة ثابتة
final List<Service> services = [
  Service(title: 'الأعمال الكهربائية', imageAsset: 'assets/images/001.png'),
  Service(title: 'الدهان والتشطيبات', imageAsset: 'assets/images/002.png'),
  Service(title: 'صيانة الأجهزة المنزلية', imageAsset: 'assets/images/003.png'),
  Service(title: 'نقل الأثاث', imageAsset: 'assets/images/004.png'),
  Service(title: 'صيانة الأجهزة المنزلية', imageAsset: 'assets/images/003.png'),
];

class ServicesList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children:
            services.map((service) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundImage: AssetImage(service.imageAsset),
                    ),
                    SizedBox(height: 8),
                    Expanded(
                      child: Container(
                        width: 90, // زِد العرض قليلاً لتناسب الكلمات الطويلة
                        child: Text(
                          service.title,
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 13),
                          maxLines: 2, // لا يزيد عن سطرين
                          overflow: TextOverflow.visible, // لا تقطع النص
                          softWrap: true, // اسمح بالالتفاف التلقائي
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
      ),
    );
  }
}
