import 'package:flutter/material.dart';
import 'package:fixiconn/SCREENS/mini_apps.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// ignore_for_file: deprecated_member_use

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 2,
          color: Colors.white,
          width: double.infinity,
        ),
        Container(
          color: Colors.black,
          padding: const EdgeInsets.symmetric(vertical: 18),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: () {
                  // Navigate to new screen
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MiniAppsScreen(),
                    ),
                  );
                },
                child: _buildNavItem(
                    const FaIcon(
                      FontAwesomeIcons.shoppingBasket,
                      color: Colors.grey,
                      size: 24,
                    ),
                    'Mini Apps'),
              ),
              _buildNavItem(
                  const FaIcon(
                    FontAwesomeIcons.commenting,
                    color: Colors.grey,
                    size: 24,
                  ),
                  'Messages'),
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color.fromARGB(255, 106, 197, 220),
                      Color.fromARGB(255, 18, 91, 140),
                    ],
                  ),
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: const Icon(
                  Icons.add,
                  color: Colors.white,
                  size: 30,
                ),
              ),
              _buildNavItem(
                  const Icon(
                    Icons.notifications_none_outlined,
                    color: Colors.grey,
                    size: 28,
                  ),
                  'Notification'),
              _buildNavItem(
                  const Icon(
                    Icons.person_outlined,
                    color: Colors.grey,
                    size: 28,
                  ),
                  'Profile'),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildNavItem(Widget icon, String label) {
    return Column(
      children: [
        icon,
        const SizedBox(height: 5),
        Text(label, style: const TextStyle(color: Colors.white, fontSize: 12)),
      ],
    );
  }
}
