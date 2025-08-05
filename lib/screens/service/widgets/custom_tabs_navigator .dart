import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:furniture_movers_project/core/theme/colors.dart';
import 'package:furniture_movers_project/screens/service/widgets/details_section.dart';
import 'package:furniture_movers_project/screens/service/widgets/questions_section.dart';
import 'package:furniture_movers_project/screens/service/widgets/rating_section.dart';
import 'package:furniture_movers_project/screens/service/models/employee_model.dart';

class CustomTabBar extends StatefulWidget {
  final EmployeeModel employee;

  const CustomTabBar({super.key, required this.employee});

  @override
  State<CustomTabBar> createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar> {
  int selectedIndex = 0;

  final List<String> titles = ['تفاصيل', 'التقييم', 'الاسئلة'];

  void handleTap(int index) {
    setState(() => selectedIndex = index);

    Widget screen;
    switch (index) {
      case 0:
        screen = DetailsSection(employee: widget.employee);
        break;
      case 1:
        screen = RatingSection(rating: widget.employee.rating); // Pass rating
        break;
      case 2:
        screen = QuestionsSection(employeeId: widget.employee.id);
        break;
      default:
        return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => screen),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        height: 40.h,
        margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
        padding: EdgeInsets.all(4.r),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Row(
          children: List.generate(titles.length, (index) {
            bool isSelected = selectedIndex == index;
            return Expanded(
              child: InkWell(
                borderRadius: BorderRadius.circular(10.r),
                onTap: () => handleTap(index),
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: isSelected ? AppColors.primary : Colors.transparent,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 6.h),
                  child: Text(
                    titles[index],
                    style: GoogleFonts.almarai(
                      fontSize: 14.sp,
                      color: isSelected ? Colors.white : AppColors.grey,
                      fontWeight:
                          isSelected ? FontWeight.bold : FontWeight.normal,
                    ),
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
