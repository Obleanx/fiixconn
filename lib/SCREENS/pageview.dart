import 'package:flutter/material.dart';
import 'package:fixiconn/SCREENS/loginscreen.dart';
import 'package:fixiconn/SCREENS/onboarding2.dart';
import 'package:fixiconn/SCREENS/onboarding_screen.dart';

class OnboardingPages extends StatefulWidget {
  OnboardingPages({super.key});

  @override
  _OnboardingPagesState createState() => _OnboardingPagesState();
}

class _OnboardingPagesState extends State<OnboardingPages> {
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            children: [
              OnboardingScreen(),
              SecondOnboardingScreen(pageController: _pageController),
              LoginOnboardingScreen(pageController: _pageController),
            ],
          ),
        ],
      ),
    );
  }
}
