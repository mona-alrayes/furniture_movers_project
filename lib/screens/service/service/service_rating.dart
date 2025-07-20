import 'package:flutter/material.dart';

class ServiceRatingScreen extends StatelessWidget {
  const ServiceRatingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // أبعاد التصميم
    const double screenWidth = 428;
    const double barHeight = 8;
    const double barRadius = 6;
    const Color mainBlue = Color(0xff4A87CB);
    const Color barBg = Color(0xFFE9F0FB);
    const Color starColor = Color(0xFFFFC107);
    const double ratingFontSize = 32;
    const double ratingLabelFontSize = 16;
    const double ratingCountFontSize = 14;
    const double sectionPadding = 24;
    const double barLabelFontSize = 14;
    const double barPercentFontSize = 12;
    const double barSpacing = 12;
    const double buttonHeight = 48;
    const double buttonRadius = 12;

    // بيانات التقييم
    final ratings = [
      {'label': '5 نجوم', 'percent': 0.6},
      {'label': '4 نجوم', 'percent': 0.2},
      {'label': '3 نجوم', 'percent': 0.1},
      {'label': '2 نجوم', 'percent': 0.1},
      {'label': '1 نجمة', 'percent': 0.05},
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          width: screenWidth,
          padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
          child: Column(
            children: [
              const SizedBox(height: 320),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // التقييم العددي والنجوم
                  Padding(
                    padding: const EdgeInsets.only(right: sectionPadding),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          '4.5',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: ratingFontSize,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: List.generate(5, (index) {
                            return Icon(Icons.star, color: starColor, size: 24);
                          }),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          '36 تقييم',
                          style: TextStyle(
                            color: Colors.grey.shade500,
                            fontSize: ratingCountFontSize,
                          ),
                        ),
                      ],
                    ),
                  ),
                  // أشرطة التقييم
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: sectionPadding),
                      child: Column(
                        children:
                            ratings.map((r) {
                              return Padding(
                                padding: const EdgeInsets.only(
                                  bottom: barSpacing,
                                ),
                                child: Row(
                                  children: [
                                    Text(
                                      '${((r['percent'] as double) * 100).toInt()} %',
                                      style: TextStyle(
                                        color: mainBlue,
                                        fontWeight: FontWeight.bold,
                                        fontSize: barPercentFontSize,
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    Expanded(
                                      child: Stack(
                                        children: [
                                          Container(
                                            height: barHeight,
                                            decoration: BoxDecoration(
                                              color: barBg,
                                              borderRadius:
                                                  BorderRadius.circular(
                                                    barRadius,
                                                  ),
                                            ),
                                          ),
                                          FractionallySizedBox(
                                            widthFactor: r['percent'] as double,
                                            child: Container(
                                              height: barHeight,
                                              decoration: BoxDecoration(
                                                color: mainBlue,
                                                borderRadius:
                                                    BorderRadius.circular(
                                                      barRadius,
                                                    ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    Text(
                                      r['label'] as String,
                                      style: TextStyle(
                                        color: Colors.grey.shade700,
                                        fontSize: barLabelFontSize,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }).toList(),
                      ),
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 24,
                ),
                child: SizedBox(
                  width: double.infinity,
                  height: buttonHeight,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: mainBlue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(buttonRadius),
                      ),
                    ),
                    onPressed: () {},
                    child: const Text(
                      'اضافة تقييم',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
