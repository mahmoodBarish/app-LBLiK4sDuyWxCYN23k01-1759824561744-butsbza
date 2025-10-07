import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class HighFidelityOnboardingScreen extends StatelessWidget {
  const HighFidelityOnboardingScreen({super.key});

  final List<String> _screenManifest = const [
    "High-Fidelity ( Onboarding )",
    "High-Fidelity ( Home )",
    "High-Fidelity ( Detail Item )",
    "High-Fidelity ( Order )"
  ];

  String _getRoutePath(String screenName) {
    return '/${screenName.toLowerCase().replaceAll(' ', '_').replaceAll('(', '').replaceAll(')', '').replaceAll('-', '_')}';
  }

  void _navigateToNextScreen(BuildContext context) {
    // On an onboarding screen, "Get Started" should reliably go to the home screen.
    final homeScreenName = _screenManifest.firstWhere(
      (s) => s.toLowerCase().contains('home'),
      orElse: () => _screenManifest.length > 1 ? _screenManifest[1] : _screenManifest[0],
    );
    final routeName = _getRoutePath(homeScreenName);
    context.go(routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/images/I216_106_417_719.png',
            fit: BoxFit.cover,
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.black.withOpacity(0.0),
                  const Color(0xFF050505).withOpacity(0.8),
                  const Color(0xFF050505),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: const [0.0, 0.4, 0.6],
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Fall in Love with Coffee in Blissful Delight!',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.sora(
                      fontSize: 32,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Welcome to our cozy coffee corner, where every cup is a delightful for you.',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.sora(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xFFA2A2A2),
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 32),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () => _navigateToNextScreen(context),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFC67C4E),
                        padding: const EdgeInsets.symmetric(vertical: 18),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      child: Text(
                        'Get Started',
                        style: GoogleFonts.sora(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}