import 'package:flutter/material.dart';
import 'splash_screen.dart';
import 'onboarding_screen.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: SplashScreen(),
    routes: {
      '/onboarding': (context) => OnboardingScreen(),
      '/home': (context) => HomeScreen(),
    },
  ));
}
