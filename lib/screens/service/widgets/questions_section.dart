import 'package:flutter/material.dart';
import 'package:furniture_movers_project/core/theme/colors.dart';

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

    return Column(
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
                    hintStyle: TextStyle(
                      color: Colors.grey[400],
                      fontWeight: FontWeight.w500,
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
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: Color(0xFF3B5BA9),
                  borderRadius: BorderRadius.circular(56),
                ),
                child: Image.asset(
                  'assets/icons/send-2.png',
                  width: 4,
                  height: 4,
                  color: AppColors.white,
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
                style: TextStyle(
                  color: Colors.grey[500],
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Spacer(),
              DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: 'ترتيب',
                  items: const [
                    DropdownMenuItem(value: 'ترتيب', child: Text('ترتيب')),
                  ],
                  onChanged: (v) {},
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF3B5BA9),
                  ),
                  icon: const Icon(
                    Icons.keyboard_arrow_down_rounded,
                    color: Color(0xFF3B5BA9),
                  ),
                  dropdownColor: Colors.white,
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
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(2),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.person_outline,
                          size: 20,
                          color: Color(0xFFB1B1B1),
                        ),
                        const SizedBox(width: 8),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              q['user'] as String,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              q['time'] as String,
                              style: TextStyle(
                                color: Colors.grey[400],
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),

                    const SizedBox(height: 8),
                    Text(
                      q['text'] as String,
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
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
                                  color: Color(0xFF3B5BA9),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),
                            const Icon(
                              Icons.chat_bubble_outline,
                              size: 18,
                              color: Color(0xFFB1B1B1),
                            ),
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
    );
  }
}
