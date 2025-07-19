import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furniture_movers_project/screens/furniture_moving/furniture_moving.dart';
import 'package:furniture_movers_project/screens/home/home_screen.dart';

void main() {
  runApp(
    ScreenUtilInit(
      designSize: Size(375, 812), // مقاس التصميم الأصلي من التصميم
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
            '/': (context) => HomeScreen(),
            '/furnituremoving': (context) => FurnitureMoving(),
          },
          builder: (context, widget) => MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            child: widget!,
          ),
        );
      },
    ),
  );
}
