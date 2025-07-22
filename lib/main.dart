import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furniture_movers_project/core/widgets/main_layout.dart';
import 'package:furniture_movers_project/screens/home/home_screen.dart';
import 'package:furniture_movers_project/screens/service/service_details_screen.dart';
import 'package:furniture_movers_project/screens/furniture_moving/furniture_moving.dart';
import 'screens/splash/splash_screen.dart';
import 'screens/splash/onboarding1_screen.dart';
import 'screens/splash/onboarding2_screen.dart';
import 'screens/splash/onboarding3_screen.dart';
import 'screens/auth/login_screen.dart';
import 'screens/auth/forget_password_screen.dart';
import 'screens/auth/otp_screen.dart';
import 'screens/auth/reset_password_screen.dart';
import 'screens/auth/signup_screen.dart';
import 'screens/profile/profile_screen.dart';
import 'screens/chat/chat_list_screen.dart';
import 'package:furniture_movers_project/screens/profile/about_app_screen.dart';
import 'package:furniture_movers_project/screens/profile/contact_us_screen.dart';
import 'package:furniture_movers_project/screens/profile/terms_conditions_screen.dart';
import 'package:furniture_movers_project/screens/favorite/favorite_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(428, 926), // Figma design size
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Furniture Movers',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
          ),
          initialRoute: '/splash',
          routes: {
            '/login': (_) => const LoginScreen(),
            '/home': (_) => const MainLayout(),
            '/signUp': (_) => const SignUpScreen(),
            '/forgetPassword': (_) => const ForgetPasswordScreen(),
            '/restPassword': (_) => const RestPasswordScreen(),
            '/otp': (_) => const OtpScreen(),
            '/splash': (_) => const SplashScreen(),
            '/onboarding1': (_) => const OnboardingScreen1(),
            '/onboarding2': (_) => const OnboardingScreen2(),
            '/onboarding3': (_) => const OnboardingScreen3(),
            '/chat': (_) => ChatListScreen(),
            '/TermsAndConditions': (_) => const TermsConditionsScreen(),
            '/profile': (_) => const ProfileScreen(),
            '/favorite': (_) => const FavoritesScreen(),
            '/serviceDetails': (_) => const ServiceDetailsScreen(),
            '/furnitureMoving': (_) => const FurnitureMoving(),
            '/about': (_) => const AboutAppScreen(),
            '/contactUs': (_) => const ContactUsScreen(),
          },
        );
      },
    );
  }
}



