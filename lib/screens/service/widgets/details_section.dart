import 'package:flutter/material.dart';

class DetailsSection extends StatelessWidget {
  const DetailsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const Color mainBlue = Color(0xFF3B5BA9);
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      // mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(Icons.share, color: Colors.black54),
                  ),
                  SizedBox(width: 20),
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(Icons.favorite_border, color: Colors.redAccent),
                  ),
                  SizedBox(width: 20),
                  Icon(Icons.star, color: Colors.amber, size: 28),
                  SizedBox(width: 4),
                  Text(
                    '4.5',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  // SizedBox(width: 16),
                  Spacer(),
                  Text(
                    'ناقل أثاث',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Text(
                '\$\u000014.4',
                style: TextStyle(
                  color: mainBlue,
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'علي عبدالله سعيد',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
              ),
              SizedBox(height: 16),
              Text.rich(
                TextSpan(
                  text:
                      'تقدم خدمة نقل الأثاث لدينا حلًا كاملًا وآمنًا لنقل أثاثك، بأمان وسهولة. مع تغليف احترافي وفك وتركيب الأثاث ونقل الأثاث الثقيل. فريقنا المتخصص يضمن لك عملية نقل خالية من التوتر مع خدمات تخزين مؤقتة وأسعار تنافسية. اجعل انتقالك سهلًا معنا.. ',
                  style: TextStyle(
                    color: Colors.grey.shade500,
                    fontSize: 16,
                    height: 1.7,
                  ),
                  children: [
                    TextSpan(
                      text: 'قراءة المزيد',
                      style: TextStyle(
                        color: mainBlue,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
