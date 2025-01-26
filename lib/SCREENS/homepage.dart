import 'widgets/top_navigation.dart';
import 'package:flutter/material.dart';
import 'widgets/background_image.dart';
import 'package:provider/provider.dart';
import 'widgets/bottom_navigation_bar.dart';
import 'widgets/bottom_details_section.dart';
import 'widgets/right_interaction_icons.dart';
import 'package:fixiconn/PROVIDERS/home_provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => HomeProvider(),
      child: const Scaffold(
        body: Stack(
          children: [
            BackgroundImageWidget(),
            SafeArea(
              child: Column(
                children: [
                  TopNavigationWidget(),
                  Spacer(),
                  BottomDetailsSection(),
                  CustomBottomNavigationBar(),
                ],
              ),
            ),
            Positioned(
              right: 0,
              bottom: 100,
              child: RightInteractionIcons(),
            ),
          ],
        ),
      ),
    );
  }
}
