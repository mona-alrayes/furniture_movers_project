import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'onboarding2_screen.dart';
import '../auth/login_screen.dart';

class OnboardingScreen3 extends StatelessWidget {
  const OnboardingScreen3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24.0,
                  vertical: 8,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [],
                ),
              ),
              Center(
                child: Container(
                  width: 400,
                  height: 400,
                  child: ClipOval(
                    child: Image.asset(
                      'assets/images/w3.png.png',
                      width: 400,
                      height: 400,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              SmoothPageIndicator(
                controller: _FakePageController(2),
                count: 3,
                effect: WormEffect(
                  dotColor: Colors.grey[300]!,
                  activeDotColor: const Color(0xFF4F8CFF),
                  dotHeight: 8,
                  dotWidth: 8,
                ),
              ),
              const SizedBox(height: 32),
              Text(
                'سهولة وسرعة في كل خطوة',
                style: GoogleFonts.cairo(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Text(
                  'من الحجز إلى التنفيذ، نضمن لك تجربة سريعة، بسيطة، وفعالة.',
                  style: GoogleFonts.cairo(
                    fontSize: 16,
                    color: Colors.grey[500],
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (_) => const LoginScreen()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: EdgeInsets.zero,
                      elevation: 0,
                      backgroundColor: null,
                    ).copyWith(
                      backgroundColor:
                          MaterialStateProperty.resolveWith<Color?>(
                            (states) => null,
                          ),
                      foregroundColor: MaterialStateProperty.all<Color>(
                        Colors.white,
                      ),
                    ),
                    child: Ink(
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [Color(0xFF4B75CB), Color(0xFF4999CB)],
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Container(
                        alignment: Alignment.center,
                        child: Text(
                          'ابدأ',
                          style: GoogleFonts.cairo(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const OnboardingScreen2(),
                        ),
                      );
                    },
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(
                        color: Color(0xFF4F8CFF),
                        width: 1.5,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text(
                      'رجوع',
                      style: GoogleFonts.cairo(
                        fontSize: 18,
                        color: const Color(0xFF4F8CFF),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}

class _FakePageController extends PageController {
  final int fixedIndex;
  _FakePageController(this.fixedIndex);

  @override
  double get page => fixedIndex.toDouble();
}
