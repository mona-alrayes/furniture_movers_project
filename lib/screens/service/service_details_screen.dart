import 'package:flutter/material.dart';
import './widgets/details_section.dart';
import './widgets/rating_section.dart';
import './widgets/rating_bottom_sheet.dart';
import './widgets/questions_section.dart';

class ServiceDetailsScreen extends StatefulWidget {
  const ServiceDetailsScreen({Key? key}) : super(key: key);

  @override
  State<ServiceDetailsScreen> createState() => _ServiceDetailsScreenState();
}

class _ServiceDetailsScreenState extends State<ServiceDetailsScreen> {
  int selectedTab = 0; // 0: تفاصيل، 1: تقييم، 2: أسئلة

  @override
  Widget build(BuildContext context) {
    const double screenWidth = 428;
    const double screenHeight = 926;
    const double bannerTop = 88;
    const double bannerLeft = 16;
    const double bannerWidth = 396;
    const double bannerHeight = 114;
    const double bannerRadius = 16;
    const double profileSize = 96;
    const double profileBorder = 6;
    const double profileTop = 140;
    const double profileRight = 45;
    const double tabBarTop = 265; // ✅ الجديد

    // const double tabBarTop = 247;
    const double tabBarHeight = 48;
    const double tabBarRadius = 20;
    const double tabActiveRadius = 10;
    const double tabFontSize = 16;
    const Color mainBlue = Color(0xff4B75CB);
    const Color blueservice = Color(0xff4A87CB);
    const Color tabInactive = Color(0xFFF7F8FA);
    const Color tabActive = mainBlue;
    const Color tabInactiveText = Color(0xFFB1B1B1);
    const Color dividerColor = Color(0xFFF1F1F1);
    const String profileImageAsset = 'assets/images/cat1.jpg';

    // const String profileImageUrl =
    //     'https://randomuser.me/api/portraits/men/32.jpg';
    const String? patternAsset = null;

    Widget questionsContent = const QuestionsSection();

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          width: screenWidth,
          height: screenHeight,
          color: Colors.white,
          child: Stack(
            children: [
              // AppBar مخصص
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: Column(
                  children: [
                    const SizedBox(height: 18),
                    Row(
                      children: [
                        const SizedBox(width: 16),
                        Expanded(
                          child: Center(
                            child: Text(
                              'معلومات الفني',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: dividerColor),
                          ),
                          child: const Icon(
                            Icons.arrow_forward_ios,
                            size: 20,
                            color: Colors.black54,
                          ),
                        ),
                        const SizedBox(width: 16),
                      ],
                    ),
                    const SizedBox(height: 25),
                    Divider(thickness: 1, color: dividerColor),
                  ],
                ),
              ),
              // البانر الأزرق
              Positioned(
                top: bannerTop,
                left: bannerLeft,
                child: Container(
                  width: bannerWidth,
                  height: bannerHeight,
                  decoration: BoxDecoration(
                    color: mainBlue,
                    borderRadius: BorderRadius.circular(bannerRadius),
                    image:
                        patternAsset != null
                            ? DecorationImage(
                              image: AssetImage(patternAsset),
                              fit: BoxFit.cover,
                            )
                            : null,
                  ),
                ),
              ),
              // صورة البروفايل
              Positioned(
                top: profileTop,
                right: profileRight,
                child: Container(
                  width: profileSize + profileBorder * 2,
                  height: profileSize + profileBorder * 2,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.white,
                      width: profileBorder,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 6,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: ClipOval(
                    child: Image.asset(
                      profileImageAsset,
                      width: profileSize,
                      height: profileSize,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              // التاب بار
              Positioned(
                top: tabBarTop,
                left: 16,
                right: 16,
                child: Container(
                  height: tabBarHeight,
                  decoration: BoxDecoration(
                    color: tabInactive,
                    borderRadius: BorderRadius.circular(tabBarRadius),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              selectedTab = 0;
                            });
                          },
                          child: Container(
                            height: tabBarHeight,
                            decoration: BoxDecoration(
                              color: selectedTab == 0 ? tabActive : tabInactive,
                              borderRadius: BorderRadius.circular(
                                tabActiveRadius,
                              ),
                            ),
                            child: Center(
                              child: Text(
                                'تفاصيل',
                                style: TextStyle(
                                  color:
                                      selectedTab == 0
                                          ? Colors.white
                                          : tabInactiveText,
                                  fontWeight: FontWeight.bold,
                                  fontSize: tabFontSize,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              selectedTab = 1;
                            });
                          },
                          child: Container(
                            height: tabBarHeight,
                            decoration: BoxDecoration(
                              color: selectedTab == 1 ? tabActive : tabInactive,
                              borderRadius: BorderRadius.circular(
                                tabActiveRadius,
                              ),
                            ),
                            child: Center(
                              child: Text(
                                'التقييم',
                                style: TextStyle(
                                  color:
                                      selectedTab == 1
                                          ? Colors.white
                                          : tabInactiveText,
                                  fontWeight: FontWeight.bold,
                                  fontSize: tabFontSize,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              selectedTab = 2;
                            });
                          },
                          child: Container(
                            height: tabBarHeight,
                            decoration: BoxDecoration(
                              color: selectedTab == 2 ? tabActive : tabInactive,
                              borderRadius: BorderRadius.circular(
                                tabActiveRadius,
                              ),
                            ),
                            child: Center(
                              child: Text(
                                'الاسئلة',
                                style: TextStyle(
                                  color:
                                      selectedTab == 2
                                          ? Colors.white
                                          : tabInactiveText,
                                  fontWeight: FontWeight.bold,
                                  fontSize: tabFontSize,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              if (selectedTab == 0)
                Positioned(
                  top: 350, // جرّب قيمة أعلى من 311 لتلاحظ الفرق
                  left: 0,
                  right: 0,
                  bottom: 88,
                  child: DetailsSection(),
                ),
              if (selectedTab == 1)
                Positioned(
                  top: 350,
                  left: 0,
                  right: 0,
                  bottom: 88,
                  child: RatingSection(),
                ),
              if (selectedTab == 2)
                Positioned(
                  top: 350,
                  left: 0,
                  right: 0,
                  bottom: 88,
                  child: questionsContent,
                ),

              // محتوى الصفحة حسب التبويب في منتصف الصفحة وفوق الزر
              // if (selectedTab == 0)
              //   Positioned.fill(
              //     top: tabBarTop + tabBarHeight + 16,
              //     bottom: 88,
              //     child: DetailsSection(),
              //   ),
              // if (selectedTab == 1)
              //   Positioned.fill(
              //     top: tabBarTop + tabBarHeight + 16,
              //     bottom: 88,
              //     child: RatingSection(),
              //   ),
              // if (selectedTab == 2)
              //   Positioned.fill(
              //     top: tabBarTop + tabBarHeight + 16,
              //     bottom: 88,
              //     child: questionsContent,
              //   ),
              // زر طلب الخدمة أو إضافة تقييم في الأسفل دائماً
              if (selectedTab == 0)
                Positioned(
                  left: 24,
                  right: 24,
                  bottom: 32,
                  child: SizedBox(
                    height: 56,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: mainBlue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () {},
                      child: Text(
                        'طلب الخدمة',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              if (selectedTab == 1)
                Positioned(
                  left: 24,
                  right: 24,
                  bottom: 32,
                  child: SizedBox(
                    height: 48,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: blueservice,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () {
                        showRatingBottomSheet(context);
                      },
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
