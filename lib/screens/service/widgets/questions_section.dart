import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furniture_movers_project/core/theme/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'employee_question_model.dart';

class QuestionsSection extends StatelessWidget {
  final int employeeId;

  const QuestionsSection({Key? key, required this.employeeId})
    : super(key: key);

  //تمرير اي دي العامل
  Future<List<EmployeeQuestion>> fetchQuestions(int employeeId) async {
    final response = await http.get(
      Uri.parse(
        'https://ftcbwmmsnykncncsyrfs.supabase.co/rest/v1/employee_questions?employee_id=eq.$employeeId',
      ),
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZ0Y2J3bW1zbnlrbmNuY3N5cmZzIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTMzNjYzMjMsImV4cCI6MjA2ODk0MjMyM30.6p3lvgHZNRpgKTroIxA5TH_CPe3QsnihRqpqV_f__kw',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZ0Y2J3bW1zbnlrbmNuY3N5cmZzIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTMzNjYzMjMsImV4cCI6MjA2ODk0MjMyM30.6p3lvgHZNRpgKTroIxA5TH_CPe3QsnihRqpqV_f__kw',
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body);
      return jsonData.map((e) => EmployeeQuestion.fromJson(e)).toList();
    } else {
      throw Exception('فشل في جلب البيانات');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Column(
        children: [
          // ✅ حقل إدخال السؤال
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
                FutureBuilder<List<EmployeeQuestion>>(
                  future: fetchQuestions(employeeId),
                  builder: (context, snapshot) {
                    int questionCount = 0;
                    if (snapshot.hasData) {
                      questionCount = snapshot.data!.length;
                    }

                    return Text(
                      'أسئلة $questionCount',
                      style: GoogleFonts.almarai(
                        color: AppColors.grey,
                        fontWeight: FontWeight.w400,
                        fontSize: 18.sp,
                      ),
                    );
                  },
                ),
                const Spacer(),
                Container(
                  width: 100.w,
                  height: 40.h,
                  decoration: BoxDecoration(
                    color: AppColors.lightPrimaryGrey,
                    borderRadius: BorderRadius.circular(20),
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

          //  عرض الأسئلة باستخدام employeeId
          Expanded(
            child: FutureBuilder<List<EmployeeQuestion>>(
              future: fetchQuestions(employeeId),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('حدث خطأ: ${snapshot.error}'));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(child: Text('لا يوجد أسئلة حالياً'));
                }

                final questions = snapshot.data!;

                return ListView.separated(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
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
                                width: 40.w,
                                height: 40.w,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: Colors.white,
                                    width: 2,
                                  ),
                                ),
                                child: const Icon(
                                  Icons.person_outline,
                                  size: 20,
                                  color: AppColors.primary,
                                ),
                              ),
                              const SizedBox(width: 8),
                              Column(
                                children: [
                                  Text(
                                    'مستخدم مجهول',
                                    style: GoogleFonts.almarai(
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  Text(
                                    'منذ قليل',
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
                            q.question,
                            style: GoogleFonts.almarai(
                              fontWeight: FontWeight.w500,
                              fontSize: 15.sp,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8),
                            child: GestureDetector(
                              onTap: () {},
                              child: Text(
                                'رد',
                                style: TextStyle(
                                  color: AppColors.primary,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
