import 'package:flutter/material.dart';
import 'package:fixiconn/SCREENS/pageview.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (_) => const OnboardingPages()),
          );
        },
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromARGB(255, 106, 197, 220),
                Color.fromARGB(255, 18, 91, 140),
              ],
            ),
          ),
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Spacer(flex: 2),
              // Logo and Title
              Column(
                children: [
                  Icon(
                    Icons.code, // Placeholder for F icon
                    size: 80,
                    color: Colors.white,
                  ),
                  Text(
                    'FIIXCONN',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Connect, Shop, Play.',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      // fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Earn with Us',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
              Spacer(flex: 2),
              // Footer
              Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: Text(
                  'All rights reserved\n        © 2024 ',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
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
