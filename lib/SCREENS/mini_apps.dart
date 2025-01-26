import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MiniAppsScreen extends StatefulWidget {
  const MiniAppsScreen({super.key});

  @override
  _MiniAppsScreenState createState() => _MiniAppsScreenState();
}

class _MiniAppsScreenState extends State<MiniAppsScreen> {
  bool _isDarkMode = false;

  // Define theme colors
  late final ThemeColors _colors = ThemeColors(
    background: _isDarkMode ? Colors.white : const Color(0xFF001F3F),
    text: _isDarkMode ? const Color(0xFF001F3F) : Colors.white,
    subText: _isDarkMode ? Colors.grey.shade700 : Colors.grey,
    iconColor: _isDarkMode ? const Color(0xFF001F3F) : Colors.white,
  );

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness:
            _isDarkMode ? Brightness.dark : Brightness.light,
        systemNavigationBarColor: _colors.background,
      ),
      child: Material(
        child: Container(
          color: _colors.background,
          child: SafeArea(
            bottom: true,
            top: false,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Top Stack with Image and Header
                Stack(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.5,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('lib/images/game1.jpeg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),

                    // Header Row
                    Positioned(
                      top: 20,
                      left: 0,
                      right: 0,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          children: [
                            Container(
                              height: 35,
                              width: 35,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border:
                                    Border.all(color: Colors.white, width: 2),
                              ),
                              child: IconButton(
                                icon: const Icon(Icons.arrow_back,
                                    size: 16, color: Colors.white),
                                onPressed: () => Navigator.pop(context),
                              ),
                            ),
                            const SizedBox(width: 30),
                            const Text(
                              'Mini Apps',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(width: 20),
                            IconButton(
                              icon: const Icon(Icons.search,
                                  color: Colors.white, size: 30),
                              onPressed: () {},
                            ),
                            IconButton(
                              icon:
                                  const Icon(Icons.church, color: Colors.white),
                              onPressed: () {},
                            ),
                            Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border:
                                    Border.all(color: Colors.white, width: 2),
                              ),
                              child: const SizedBox(
                                width: 30,
                                height: 30,
                                child: CircleAvatar(
                                  backgroundImage:
                                      AssetImage('lib/images/Natural.jpeg'),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),

                // Content Section
                Expanded(
                  child: Container(
                    color: _colors.background,
                    padding: const EdgeInsets.all(16),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Trending Section
                          Text(
                            'Trending',
                            style: TextStyle(
                                color: _colors.text,
                                fontSize: 22,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'trending games from 30 days',
                            style:
                                TextStyle(color: _colors.subText, fontSize: 14),
                          ),

                          // Horizontal Scrollable Game Containers
                          const SizedBox(height: 16),
                          SizedBox(
                            height: 180,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: 6,
                              itemBuilder: (context, index) => Padding(
                                padding: const EdgeInsets.only(right: 12),
                                child: Column(
                                  children: [
                                    Container(
                                      width: 120,
                                      height: 120,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        image: DecorationImage(
                                          image: AssetImage(
                                              'lib/images/game${index + 9}.jpeg'),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      'Game ${index + 1}',
                                      style: TextStyle(color: _colors.text),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),

                          // Categories Section
                          const SizedBox(height: 20),
                          Text(
                            'Categories',
                            style: TextStyle(
                                color: _colors.text,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),

                          // Categories Grid
                          const SizedBox(height: 16),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                Column(
                                  children: List.generate(
                                    3,
                                    (index) => _buildCategoryItem(index + 1),
                                  ),
                                ),
                                const SizedBox(width: 100),
                                Column(
                                  children: List.generate(
                                    3,
                                    (index) => _buildCategoryItem(index + 4),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          // Recently Opened Section
                          const SizedBox(height: 20),
                          Text(
                            'Recently Opened',
                            style: TextStyle(
                                color: _colors.text,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Here are some of your played games',
                            style:
                                TextStyle(color: _colors.subText, fontSize: 14),
                          ),

                          // Recently Opened Games
                          const SizedBox(height: 16),
                          SizedBox(
                            height: 200,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: 6,
                              itemBuilder: (context, index) => Padding(
                                padding: const EdgeInsets.only(right: 20),
                                child: Column(
                                  children: [
                                    Container(
                                      width: 150,
                                      height: 150,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        image: DecorationImage(
                                          image: AssetImage(
                                              'lib/images/game${index + 1}.jpeg'),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      'Game ${index + 1}',
                                      style: TextStyle(color: _colors.text),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryItem(int index) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Container(
            width: 90,
            height: 90,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                image: AssetImage('lib/images/game$index.jpeg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Text(
            'Game $index',
            style: TextStyle(color: _colors.text),
          ),
        ],
      ),
    );
  }
}

// Theme colors class to manage colors
class ThemeColors {
  final Color background;
  final Color text;
  final Color subText;
  final Color iconColor;

  ThemeColors({
    required this.background,
    required this.text,
    required this.subText,
    required this.iconColor,
  });
}
