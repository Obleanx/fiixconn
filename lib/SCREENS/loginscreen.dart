import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fixiconn/SCREENS/homepage.dart';
import 'package:fixiconn/PROVIDERS/home_provider.dart';

class LoginOnboardingScreen extends StatefulWidget {
  final PageController pageController;

  const LoginOnboardingScreen({super.key, required this.pageController});

  @override
  // ignore: library_private_types_in_public_api
  _LoginOnboardingScreenState createState() => _LoginOnboardingScreenState();
}

class _LoginOnboardingScreenState extends State<LoginOnboardingScreen> {
  bool _obscurePassword = true;
  void _navigateToHome() {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => ChangeNotifierProvider(
                create: (_) => HomeProvider(),
                child: const HomePage(),
              )),
    );
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = GoogleFonts.montserratTextTheme(
      Theme.of(context).textTheme,
    );
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40),

            // Back Navigation
            Container(
              width: 24, // Set the diameter of the circle
              height: 23, // Set the diameter of the circle
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                    color: const Color.fromARGB(131, 0, 0, 0), width: 1.5),
              ),
              child: IconButton(
                padding:
                    EdgeInsets.zero, // Remove extra padding around the icon
                iconSize: 16,
                icon: const Icon(
                  Icons.arrow_back,
                  color: Color.fromARGB(131, 0, 0, 0),
                ),
                onPressed: () => widget.pageController.previousPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                ),
              ),
            ),

            const SizedBox(height: 60),

            // FIIXCONN Header
            Center(
              child: Column(
                children: [
                  Icon(
                    Icons.code,
                    size: 50,
                    color: Colors.blue[900],
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'FIIXCONN',
                    style: TextStyle(
                      color: Colors.blue[900],
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // Username Field
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Username',
                    style: textTheme.bodyMedium?.copyWith(color: Colors.black),
                  ),
                  TextSpan(
                    text: '*',
                    style: textTheme.bodyMedium?.copyWith(color: Colors.red),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 5),
            TextField(
              decoration: InputDecoration(
                isDense: true,
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 12,
                  horizontal: 10,
                ),
                border: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide(
                      color: Colors.grey.shade700), // Dark grey border
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Password Field
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Password',
                    style: textTheme.bodyMedium?.copyWith(color: Colors.black),
                  ),
                  TextSpan(
                    text: '*',
                    style: textTheme.bodyMedium?.copyWith(color: Colors.red),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 5),

            TextField(
              obscureText: _obscurePassword,
              decoration: InputDecoration(
                isDense: true,
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 12,
                  horizontal: 10,
                ),
                border: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide(
                      color: Colors.grey.shade700), // Dark grey border
                ),
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscurePassword ? Icons.visibility_off : Icons.visibility,
                    size: 18,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscurePassword = !_obscurePassword;
                    });
                  },
                ),
              ),
            ),

            const SizedBox(height: 30),

            // Login Button
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(8), // Slightly curved edges
                  ),
                  backgroundColor: Colors.blue[900],
                  fixedSize: const Size(350, 50), // Button width and height
                ),
                onPressed: _navigateToHome,
                child: const Text(
                  'Login',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),

            const SizedBox(height: 10),

            // Forgot Password
            Center(
              child: TextButton(
                onPressed: () {
                  // Implement forgot password logic
                },
                child: Text(
                  'Forgotten Password?',
                  style: TextStyle(color: Colors.blue[900]),
                ),
              ),
            ),

            const Spacer(),

            // Create New Account
            Center(
              child: TextButton(
                onPressed: () {
                  // Implement create account logic
                },
                child: Text(
                  'Create new account',
                  style: TextStyle(
                    color: Colors.blue[900],
                    fontSize: 17,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
