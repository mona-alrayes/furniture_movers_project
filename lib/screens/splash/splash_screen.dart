import 'dart:async';
import 'package:flutter/material.dart';
import 'onboarding1_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const OnboardingScreen1()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomPaint(
        painter: DottedBackgroundPainter(),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 140,
                height: 140,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFFE0E0E0),
                ),
                child: const Center(
                  child: Icon(
                    Icons.flutter_dash,
                    size: 64,
                    color: Colors.blueAccent,
                  ),
                ),
              ),
              const SizedBox(height: 32),
              Text(
                'خدماتك',
                style: TextStyle(
                  fontFamily: 'Cairo',
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DottedBackgroundPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.grey.withOpacity(0.15)
      ..style = PaintingStyle.fill;

    const double step = 24; 
    const double dotRadius = 1.5;

    for (double y = step / 2; y < size.height; y += step) {
      for (double x = step / 2; x < size.width; x += step) {
        canvas.drawCircle(Offset(x, y), dotRadius, paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}