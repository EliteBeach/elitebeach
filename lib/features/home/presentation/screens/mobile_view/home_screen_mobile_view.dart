import 'package:elite_beach/core/utils/helper.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/assets.dart';
import 'bottom_nav_bar.dart';

class HomeScreenMobileView extends StatelessWidget {
  const HomeScreenMobileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            AssetsData.homeImage,
            fit: BoxFit.cover,
            height: context.screenHeight,
            width: context.screenWidth,
          ),
          Padding(
            padding:
                EdgeInsets.symmetric(horizontal: context.screenWidth * .05),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      AssetsData.eliteLogoNoBg,
                      width: 100,
                      height: 100,
                      color: Colors.white,
                    ),
                    const Spacer(),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Elite Beach Resort & Hotel',
                          style: TextStyle(
                            letterSpacing: 3,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'EduAUVICWANTPre',
                            fontSize: context.screenWidth * .04,
                          ),
                        ),
                        Container(
                          height: 3,
                          width: context.screenWidth - 190,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ],
                    ),
                    const Spacer()
                  ],
                ),
                const Spacer(),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30)),
                    color: Colors.transparent.withOpacity(
                      .5,
                    ),
                  ),
                  child: const BottomNavBar(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
