import 'package:flutter/material.dart';
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
import 'screens/profile/profile_screen.dart';





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
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Furniture movers',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
          ),

          initialRoute: '/login',
          routes: {

            '/login': (_) => const LoginScreen(),
            '/home' : (_) => const HomeScreen () 
            
          // },
        );
      }
    );
  }
}
