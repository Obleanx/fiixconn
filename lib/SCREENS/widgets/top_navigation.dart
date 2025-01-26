import 'package:flutter/material.dart';

class TopNavigationWidget extends StatefulWidget {
  const TopNavigationWidget({Key? key}) : super(key: key);

  @override
  _TopNavigationWidgetState createState() => _TopNavigationWidgetState();
}

class _TopNavigationWidgetState extends State<TopNavigationWidget> {
  String _selectedTab = 'LIVE';

  Widget _buildTappableText(String text) {
    bool isSelected = _selectedTab == text;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedTab = text;
        });
      },
      child: Column(
        children: [
          Text(text,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight:
                      isSelected ? FontWeight.bold : FontWeight.normal)),
          if (isSelected)
            Container(
              width: text.length * 6.0, // Adjust multiplier as needed
              height: 2,
              color: Colors.white,
            ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 40),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.menu, color: Colors.white),
            onPressed: () {},
          ),
          const SizedBox(width: 30),
          _buildTappableText('LIVE'),
          const SizedBox(width: 10),
          _buildTappableText('Following'),
          const SizedBox(width: 20),
          _buildTappableText('For You'),
          const Spacer(),
          IconButton(
            icon: const Icon(
              Icons.search,
              color: Colors.white,
              size: 30,
            ),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
