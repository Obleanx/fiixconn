import 'package:flutter/material.dart';

class TopNavigationWidget extends StatelessWidget {
  const TopNavigationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.menu, color: Colors.white),
            onPressed: () {},
          ),
          const SizedBox(width: 10),
          const Text('LIVE', style: TextStyle(color: Colors.white)),
          const SizedBox(width: 10),
          const Text('Following', style: TextStyle(color: Colors.white)),
          const SizedBox(width: 10),
          const Text('For You', style: TextStyle(color: Colors.white)),
          const Spacer(),
          IconButton(
            icon: const Icon(Icons.search, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
