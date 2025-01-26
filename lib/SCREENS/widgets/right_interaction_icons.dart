import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RightInteractionIcons extends StatelessWidget {
  const RightInteractionIcons({super.key});

  Widget _buildInteractionItem(IconData icon, String count) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        FaIcon(icon, color: Colors.white, size: 26),
        Text(
          count,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 12,
          ),
        ),
      ],
    );
  }

  Widget _buildImageContainer() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.circular(8),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.asset(
          'lib/images/game1.jpeg',
          width: 35,
          height: 35,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.only(right: 10.0),
          child: CircleAvatar(
            radius: 25,
            backgroundColor: Colors.white,
            child: CircleAvatar(
              radius: 22,
              backgroundImage: AssetImage('lib/images/Natural.jpeg'),
            ),
          ),
        ),
        const SizedBox(height: 15),
        _buildInteractionItem(FontAwesomeIcons.heart, '1.2k'),
        const SizedBox(height: 15),
        // ignore: deprecated_member_use
        _buildInteractionItem(FontAwesomeIcons.commenting, '17'),
        const SizedBox(height: 15),
        _buildInteractionItem(FontAwesomeIcons.bookmark, '12'),
        const SizedBox(height: 15),
        _buildInteractionItem(FontAwesomeIcons.share, '24'),
        const SizedBox(height: 20),
        _buildImageContainer(),
      ],
    );
  }
}
