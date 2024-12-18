import 'package:elite_beach/core/utils/assets.dart';
import 'package:elite_beach/core/utils/helper.dart';
import 'package:elite_beach/features/home/presentation/screens/mobile_view/bottom_nav_bar.dart';
import 'package:flutter/material.dart';

class AboutMobileScreen extends StatelessWidget {
  const AboutMobileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          AssetsData.eliteLogoNoBg,
          width: context.screenWidth * .1,
          height: context.screenHeight * .1,
        ),
        const Spacer(),
        const BottomNavBar(),
      ],
    );
  }
}
