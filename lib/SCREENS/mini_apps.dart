import 'package:flutter/material.dart';

class MiniAppsScreen extends StatelessWidget {
  const MiniAppsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Mini Apps')),
      body: const Center(child: Text('Mini Apps Screen')),
    );
  }
}
