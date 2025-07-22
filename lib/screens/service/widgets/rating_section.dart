import 'package:flutter/material.dart';
import 'package:furniture_movers_project/core/theme/colors.dart';

class RatingSection extends StatefulWidget {
  const RatingSection({Key? key}) : super(key: key);

  @override
  State<RatingSection> createState() => _RatingSectionState();
}

class _RatingSectionState extends State<RatingSection> {
  int rating = 4;

  @override
  Widget build(BuildContext context) {
    const Color mainBlue = Color(0xFF3B5BA9);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            textDirection: TextDirection.rtl,
            children: [
              // العمود الأيسر (النسب)
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(right: 6),
                  child: Column(
                    children:
                        [
                          {'percent': 0.6, 'label': '5 نجوم'},
                          {'percent': 0.2, 'label': '4 نجوم'},
                          {'percent': 0.1, 'label': '3 نجوم'},
                          {'percent': 0.1, 'label': '2 نجوم'},
                          {'percent': 0.05, 'label': '1 نجمة'},
                        ].map((r) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 12),
                            child: Row(
                              children: [
                                Text(
                                  '${((r['percent'] as double) * 100).toInt()} %',
                                  style: TextStyle(
                                    color: mainBlue,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Expanded(
                                  child: Stack(
                                    children: [
                                      Container(
                                        height: 8,
                                        decoration: BoxDecoration(
                                          color: const Color(0xFFE9F0FB),
                                          borderRadius: BorderRadius.circular(
                                            6,
                                          ),
                                        ),
                                      ),
                                      FractionallySizedBox(
                                        widthFactor: r['percent'] as double,
                                        child: Container(
                                          height: 8,
                                          decoration: BoxDecoration(
                                            color: mainBlue,
                                            borderRadius: BorderRadius.circular(
                                              6,
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
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          );
                        }).toList(),
                  ),
                ),
              ),

              // العمود الأيمن (التقييم والنجوم)
              Padding(
                padding: const EdgeInsets.only(left: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      '4.5',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 32,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(5, (index) {
                          return IconButton(
                            icon: Icon(
                              index < rating ? Icons.star : Icons.star_border,
                              color: AppColors.yellow,
                              size: 20,
                            ),
                            onPressed: () {
                              setState(() {
                                rating = index + 1;
                              });
                            },
                          );
                        }),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '36 تقييم',
                      style: TextStyle(
                        color: Colors.grey.shade500,
                        fontSize: 14,
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
