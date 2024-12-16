import 'package:elite_beach/core/utils/helper.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/assets.dart';
import '../../widgets/home_navigation_item.dart';

class HomeScreenWebView extends StatelessWidget {
  const HomeScreenWebView({super.key});

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
            padding: EdgeInsets.symmetric(
              horizontal: context.screenWidth * .0,
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Image.asset(
                      AssetsData.eliteLogoNoBg,
                      width: 100,
                      height: 100,
                      color: Colors.orange,
                    ),
                    SizedBox(
                      width: context.screenWidth * .03,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
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
                            HomeNavigationItem(
                              itemName: 'Restaurant &Bars',
                              tapHandler: () {},
                            ),
                            SizedBox(
                              width: context.screenWidth * .03,
                            ),
                            HomeNavigationItem(
                              itemName: 'Facilities',
                              tapHandler: () {},
                            ),
                            SizedBox(
                              width: context.screenWidth * .03,
                            ),
                            HomeNavigationItem(
                              itemName: 'Weeding & Events',
                              tapHandler: () {},
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
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
                    )
                  ],
                ),
                SizedBox(
                  height: context.screenHeight * .15,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: context.screenWidth * .01,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.asset(
                              AssetsData.whatsApp,
                              color: Colors.white,
                              width: 20,
                              height: 20,
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Image.asset(
                              color: Colors.white,
                              width: 20,
                              height: 20,
                              AssetsData.instagram,
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Image.asset(
                              color: Colors.white,
                              width: 20,
                              height: 20,
                              AssetsData.facebook,
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Image.asset(
                              color: Colors.white,
                              width: 20,
                              height: 20,
                              AssetsData.call,
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                            Container(
                              margin: const EdgeInsets.symmetric(horizontal: 8),
                              height: 100,
                              width: 5,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.orange,
                              ),
                            )
                          ],
                        ),
                      ),
                      const Expanded(
                        flex: 10,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Discover Elite Beach With us !',
                              style: TextStyle(
                                fontSize: 20,
                                letterSpacing: 4,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'EduAUVICWANTPre',
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              'Welcome To Elite Beach Resort And Hotel',
                              style: TextStyle(
                                letterSpacing: 4,
                                fontSize: 30,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'EduAUVICWANTPre',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
