import 'package:flutter/material.dart';

class SecondOnboardingScreen extends StatelessWidget {
  final PageController pageController;

  const SecondOnboardingScreen({super.key, required this.pageController});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('lib/images/bck.webp'),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        children: [
          // Top row with language and dropdown
          const Padding(
            padding: EdgeInsets.only(top: 60, right: 10),
            child: Align(
              alignment: Alignment.topRight,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'English',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Icon(
                    Icons.arrow_drop_down,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ),
          const Spacer(flex: 1),
          const Column(
            children: [
              Icon(
                Icons.code,
                size: 80,
                color: Colors.white,
              ),
              Text(
                'FIIXCONN',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () => pageController.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  ),
                  style: ElevatedButton.styleFrom(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(8), // Slightly curved edges
                    ),
                    backgroundColor: Colors.white, // Default color for login
                    fixedSize: const Size(150, 50), // Button width and height
                  ),
                  child: const Text(
                    'Login',
                    style: TextStyle(
                      color: Color(0xFF0D47A1),
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () => pageController.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  ),
                  style: ElevatedButton.styleFrom(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(8), // Slightly curved edges
                    ),
                    backgroundColor: Colors.blue[900],
                    fixedSize: const Size(150, 50), // Button width and height
                  ),
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(color: Colors.white), // White text color
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 50),
        ],
      ),
    );
  }
}
