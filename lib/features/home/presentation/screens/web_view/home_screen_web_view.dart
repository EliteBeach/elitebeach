import 'package:elite_beach/core/utils/helper.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/assets.dart';
import '../../widgets/home_navigation_item.dart';

class HomeScreenWebView extends StatelessWidget {
  const HomeScreenWebView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // bottomNavigationBar: BottomNavigationBar(
      //   items: const [
      //     BottomNavigationBarItem(
      //       label: 'b',
      //       icon: Icon(
      //         Icons.add,
      //       ),
      //     ),
      //     BottomNavigationBarItem(
      //       label: 'd',
      //       icon: Icon(
      //         Icons.add,
      //       ),
      //     )
      //   ],
      // ),
      body: ListView(
        children: [
          Stack(
            children: [
              Image.asset(
                AssetsData.pool,
                fit: BoxFit.cover,
                height: context.screenHeight,
                width: context.screenWidth,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: context.screenWidth * .0,
                ),
                child: Row(
                  children: [
                    Image.asset(
                      AssetsData.eliteLogoNoBg,
                      width: 100,
                      height: 100,
                    ),
                    SizedBox(
                      width: context.screenWidth * .03,
                    ),
                    HomeNavigationItem(
                      itemName: 'Home',
                      tapHandler: () {},
                    ),
                    SizedBox(
                      width: context.screenWidth * .03,
                    ),
                    HomeNavigationItem(
                      itemName: 'About',
                      tapHandler: () {},
                    ),
                    SizedBox(
                      width: context.screenWidth * .03,
                    ),
                    HomeNavigationItem(
                      itemName: 'Gallery',
                      tapHandler: () {},
                    ),
                    SizedBox(
                      width: context.screenWidth * .03,
                    ),
                    HomeNavigationItem(
                      itemName: 'Units',
                      tapHandler: () {},
                    ),
                    SizedBox(
                      width: context.screenWidth * .03,
                    ),
                    HomeNavigationItem(
                      itemName: 'Offers',
                      tapHandler: () {},
                    ),
                    SizedBox(
                      width: context.screenWidth * .03,
                    ),
                    // HomeNavigationItem(
                    //   itemName: 'Restaurant&Bars',
                    //   tapHandler: () {},
                    // ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
