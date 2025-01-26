import 'package:flutter/material.dart';

class RightInteractionIcons extends StatelessWidget {
  const RightInteractionIcons({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        CircleAvatar(
          radius: 25,
          backgroundColor: Colors.white,
          child: CircleAvatar(
            radius: 22,
            backgroundImage: AssetImage('lib/images/Natural.jpeg'),
          ),
        ),
        SizedBox(height: 20),
        Column(
          children: [
            Icon(Icons.favorite_border, color: Colors.white),
            Text('1.2k', style: TextStyle(color: Colors.white)),
          ],
        ),
        SizedBox(height: 20),
        Column(
          children: [
            Icon(Icons.chat_bubble_outline, color: Colors.white),
            Text('17', style: TextStyle(color: Colors.white)),
          ],
        ),
        SizedBox(height: 20),
        Column(
          children: [
            Icon(Icons.bookmark_border, color: Colors.white),
            Text('12', style: TextStyle(color: Colors.white)),
          ],
        ),
        SizedBox(height: 20),
        Column(
          children: [
            Icon(Icons.share, color: Colors.white),
            Text('24', style: TextStyle(color: Colors.white)),
          ],
        ),
      ],
    );
  }
}
