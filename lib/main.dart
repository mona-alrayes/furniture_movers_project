import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furniture_movers_project/screens/furniture_moving/furniture_moving.dart';
import 'package:furniture_movers_project/screens/home/home_screen.dart';

void main() {
  runApp(
    ScreenUtilInit(
      designSize: Size(375, 812), // مقاس التصميم الأصلي من التصميم
=======
import 'package:furniture_movers_project/screens/home/home_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'screens/splash/splash_screen.dart';
import 'screens/splash/onboarding1_screen.dart';
import 'screens/splash/onboarding2_screen.dart';
import 'screens/splash/onboarding3_screen.dart';
import 'screens/auth/login_screen.dart';
import 'screens/auth/forget_password_screen.dart';
import 'screens/auth/logging_screen.dart';
import 'screens/auth/otp_screen.dart';
import 'screens/auth/reset_password_screen.dart';
import 'screens/auth/signup_screen.dart';
import 'screens/home/home_screen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(428, 926), // المقاسات حسب تصميم Figma
>>>>>>> 2702b2edcd070ac5c4a1561ad67e8a2557806103
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Furniture Movers',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          ),
          initialRoute: '/',
          routes: {
<<<<<<< HEAD
            '/': (context) => HomeScreen(),
            '/furnituremoving': (context) => FurnitureMoving(),
=======
          //  '/login': (_) => const LoginScreen(),
          //    '/home' : (_) => const HomeScreen () 
>>>>>>> 2702b2edcd070ac5c4a1561ad67e8a2557806103
          },
          builder: (context, widget) => MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            child: widget!,
          ),
        );
<<<<<<< HEAD
      },
    ),
  );
=======
      }
    );
  }
>>>>>>> 2702b2edcd070ac5c4a1561ad67e8a2557806103
}
