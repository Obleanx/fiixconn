import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fixiconn/PROVIDERS/home_provider.dart';

class BottomDetailsSection extends StatelessWidget {
  const BottomDetailsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final homeProvider = Provider.of<HomeProvider>(context);

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.face_outlined, color: Colors.white),
              const SizedBox(width: 10),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                color: Colors.black,
                child: const Row(
                  children: [
                    Text('Shop', style: TextStyle(color: Colors.white)),
                    SizedBox(width: 10),
                    Icon(Icons.arrow_drop_down, color: Colors.white),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          GestureDetector(
            onTap: () => homeProvider.toggleTextExpansion(),
            child: Text(
              homeProvider.isTextExpanded
                  ? 'This happens to be a great match! Full details about the match and everything that makes it interesting.'
                  : 'This happens to be a great match!...see more',
              style: const TextStyle(color: Colors.white),
            ),
          ),
          const SizedBox(height: 10),
          GestureDetector(
            onTap: () => homeProvider.toggleMusicInfoExpansion(),
            child: Row(
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.7),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.music_note, color: Colors.white),
                      Text(
                        homeProvider.isMusicInfoExpanded
                            ? 'Feature Presentation - Awesome Band'
                            : 'Fe...',
                        style: const TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 10),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.7),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Row(
                    children: [
                      Icon(Icons.science, color: Colors.white),
                      Text('Effect Name',
                          style: TextStyle(color: Colors.white)),
                    ],
                  ),
                ),
                const Spacer(),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Image.asset(
                      'assets/images/artist.jpg', // Replace with artist image
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
