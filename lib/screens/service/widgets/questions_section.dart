import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furniture_movers_project/core/theme/colors.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsSection extends StatelessWidget {
  const QuestionsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final questions = [
      {
        'user': 'عبدالله محمد',
        'time': 'منذ دقيقة',
        'text': 'كيفكم أخي/أختي؟ كيف يمكنني معرفة وقت الخدمة؟',
        'replies': ['رد'],
      },
      {
        'user': 'عبدالله محمد',
        'time': 'منذ 5 دقائق',
        'text':
            'كيفكم أخي/أختي؟ كيف يمكنني معرفة وقت الخدمة؟\nكيفكم أخي/أختي؟ كيف يمكنني معرفة وقت الخدمة؟',
        'replies': [],
      },
    ];

    return Scaffold(
      backgroundColor: AppColors.white,
      // appBar: CustomApp,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'طرح سؤال',
                      hintStyle: GoogleFonts.almarai(
                        color: AppColors.grey,
                        fontWeight: FontWeight.w400,
                        fontSize: 16.sp,
                      ),
                      filled: true,
                      fillColor: Colors.grey[100],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 0,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                  width: 50.w,
                  height: 50.h,
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(56),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      'assets/icons/send-2.png',
                      width: 4.w,
                      height: 4.h,
                      color: AppColors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
            child: Row(
              children: [
                Text(
                  '2 أسئلة',
                  style: GoogleFonts.almarai(
                    color: AppColors.grey,
                    fontWeight: FontWeight.w400,
                    fontSize: 18.sp,
                  ),
                ),
                const Spacer(),
                Container(
                  width: 100.w,
                  height: 40.h,
                  decoration: BoxDecoration(
                    color: AppColors.lightPrimaryGrey, // لون الخلفية
                    borderRadius: BorderRadius.circular(20), // الحواف الدائرية
                  ),
                  child: Center(
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: 'ترتيب',
                        items: [
                          DropdownMenuItem(
                            value: 'ترتيب',
                            child: Text(
                              'ترتيب',
                              style: GoogleFonts.almarai(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ],
                        onChanged: (v) {},
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF3B5BA9),
                        ),
                        icon: const Icon(
                          Icons.keyboard_arrow_down_rounded,
                          color: AppColors.primary,
                        ),
                        dropdownColor: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              itemCount: questions.length,
              separatorBuilder: (_, __) => const SizedBox(height: 12),
              itemBuilder: (context, index) {
                final q = questions[index];
                return Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: AppColors.veryLightGrey,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 40.w, // العرض
                            height: 40.w, // الارتفاع
                            decoration: BoxDecoration(
                              shape: BoxShape.circle, // يجعل الشكل دائري
                              border: Border.all(
                                color: Colors.white, // لون الحافة
                                width: 2, // سمك الحافة
                              ),
                              // لون خلفية الكونتينر (يمكنك تغييره)
                            ),
                            child: const Icon(
                              Icons.person_outline,
                              size: 20,
                              color: AppColors.primary,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Column(
                            // crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                q['user'] as String,
                                style: GoogleFonts.almarai(
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Text(
                                q['time'] as String,
                                style: GoogleFonts.almarai(
                                  color: AppColors.grey,
                                  fontSize: 13.sp,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),

                      const SizedBox(height: 8),
                      Text(
                        q['text'] as String,
                        style: GoogleFonts.almarai(
                          fontWeight: FontWeight.w500,
                          fontSize: 15.sp,
                        ),
                      ),
                      if (q['replies'] != null &&
                          (q['replies'] as List).isNotEmpty)
                        Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: Row(
                            children: [
                              GestureDetector(
                                onTap: () {},
                                child: Text(
                                  'رد',
                                  style: TextStyle(
                                    color: AppColors.primary,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 8),
                            ],
                          ),
                        ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
