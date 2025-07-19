import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class ServicesSlider extends StatelessWidget {
  final List<Map<String, String>> services = [
    {
      'image': 'assets/images/slidar.png',
      // 'discount': '20%',
      'label': 'MOVER',
    },
    // يمكنك إضافة المزيد من العناصر هنا
  ];

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 180,
        enlargeCenterPage: true,
        viewportFraction: 0.7,
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 3),
      ),
      items:
          services.map((service) {
            return Builder(
              builder: (BuildContext context) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 4,
                            offset: Offset(0, 4),
                          ),
                        ],
                        image: DecorationImage(
                          image: AssetImage(service['image']!),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                );
              },
            );
          }).toList(),
    );
  }
}
