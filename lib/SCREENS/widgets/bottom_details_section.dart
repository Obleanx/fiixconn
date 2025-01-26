import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fixiconn/PROVIDERS/home_provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 5),
                color: Colors.black,
                child: const Row(
                  children: [
                    Icon(Icons.store_outlined, color: Colors.white),
                    SizedBox(width: 5),
                    Text('Shop .4', style: TextStyle(color: Colors.white)),
                    //SizedBox(width: 10),
                    Icon(Icons.expand_more, color: Colors.white),
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
              style: const TextStyle(
                color: Colors.white,
                fontSize: 11,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 10),
          GestureDetector(
            onTap: () => homeProvider.toggleMusicInfoExpansion(),
            child: Row(
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 3, vertical: 2),
                  decoration: BoxDecoration(
                    color:
                        const Color.fromARGB(255, 77, 76, 76).withOpacity(0.7),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: [
                      FaIcon(FontAwesomeIcons.music,
                          color: Colors.white, size: 20),
                      Text(
                        homeProvider.isMusicInfoExpanded
                            ? 'Falz.How many by Falz'
                            : 'Falz.How many  [Fe...',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 10),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 3, vertical: 2),
                  decoration: BoxDecoration(
                    color:
                        const Color.fromARGB(255, 77, 76, 76).withOpacity(0.7),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: [
                      FaIcon(FontAwesomeIcons.magic, color: Colors.white),
                      const Text(
                        'Effect Name',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                        ),
                      ),
                    ],
                  ),
                ),
                // const Spacer(),
                const SizedBox(width: 20),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      'lib/images/game1.jpeg', // Replace with artist image
                      width: 35,
                      height: 35,
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
