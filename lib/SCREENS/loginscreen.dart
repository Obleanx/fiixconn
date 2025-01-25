import 'package:flutter/material.dart';

class LoginOnboardingScreen extends StatefulWidget {
  final PageController pageController;

  const LoginOnboardingScreen({Key? key, required this.pageController})
      : super(key: key);

  @override
  _LoginOnboardingScreenState createState() => _LoginOnboardingScreenState();
}

class _LoginOnboardingScreenState extends State<LoginOnboardingScreen> {
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Back Navigation
            CircleAvatar(
              backgroundColor: Colors.blue.shade50,
              child: IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.blue),
                onPressed: () => widget.pageController.previousPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                ),
              ),
            ),

            // FIIXCONN Header
            const Center(
              child: Column(
                children: [
                  Icon(
                    Icons.code,
                    size: 50,
                    color: Colors.blue,
                  ),
                  Text(
                    'FIIXCONN',
                    style: TextStyle(
                      color: Colors.blue,
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
              text: const TextSpan(
                children: [
                  TextSpan(
                    text: 'Username',
                    style: TextStyle(color: Colors.black),
                  ),
                  TextSpan(
                    text: ' *',
                    style: TextStyle(color: Colors.red),
                  ),
                ],
              ),
            ),
            const TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 20),

            // Password Field
            RichText(
              text: const TextSpan(
                children: [
                  TextSpan(
                    text: 'Password',
                    style: TextStyle(color: Colors.black),
                  ),
                  TextSpan(
                    text: ' *',
                    style: TextStyle(color: Colors.red),
                  ),
                ],
              ),
            ),
            TextField(
              obscureText: _obscurePassword,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                suffixIcon: IconButton(
                  icon: Icon(_obscurePassword
                      ? Icons.visibility_off
                      : Icons.visibility),
                  onPressed: () {
                    setState(() {
                      _obscurePassword = !_obscurePassword;
                    });
                  },
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Login Button
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  minimumSize: const Size(double.infinity, 50),
                ),
                onPressed: () {
                  // Implement login logic
                },
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
                child: const Text(
                  'Forgot Password?',
                  style: TextStyle(color: Colors.blue),
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
                child: const Text(
                  'Create New Account',
                  style: TextStyle(color: Colors.blue),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
