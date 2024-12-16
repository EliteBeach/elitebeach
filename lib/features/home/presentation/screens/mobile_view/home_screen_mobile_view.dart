import 'package:elite_beach/core/utils/helper.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/assets.dart';

class HomeScreenMobileView extends StatelessWidget {
  const HomeScreenMobileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            AssetsData.pool,
            fit: BoxFit.cover,
            height: context.screenHeight,
            width: context.screenWidth,
          ),
          Column(
            children: [
              Row(
                children: [
                  Image.asset(
                    AssetsData.eliteLogoNoBg,
                    width: 100,
                    height: 100,
                  ),
                  const Spacer(),
                  Text(
                    'Elite Beach Resort & Hotel',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'EduAUVICWANTPre',
                      fontSize: context.screenWidth * .03,
                    ),
                  ),
                  const Spacer()
                ],
              ),
              // Divider(
              //   indent: context.screenWidth * .1,
              //   endIndent: context.screenWidth * .1,
              // ),
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
                child: BottomNavigationBar(
                  type: BottomNavigationBarType.fixed,
                  backgroundColor: Colors.transparent,
                  selectedItemColor: Colors.white,
                  unselectedItemColor: Colors.grey,
                  selectedLabelStyle: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'EduAUVICWANTPre',
                  ),
                  unselectedLabelStyle: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'EduAUVICWANTPre',
                  ),
                  elevation: 0,
                  items: const [
                    BottomNavigationBarItem(
                      label: 'Home',
                      icon: Icon(
                        Icons.home_max_rounded,
                      ),
                    ),
                    BottomNavigationBarItem(
                      label: 'About',
                      icon: Icon(
                        Icons.mode_edit_rounded,
                      ),
                    ),
                    BottomNavigationBarItem(
                      label: 'Gallery',
                      icon: Icon(
                        Icons.photo_album_outlined,
                      ),
                    ),
                    BottomNavigationBarItem(
                      label: 'Units',
                      icon: Icon(
                        Icons.villa_outlined,
                      ),
                    ),
                    BottomNavigationBarItem(
                      label: 'offers',
                      icon: Icon(
                        Icons.local_offer_rounded,
                      ),
                    ),
                    BottomNavigationBarItem(
                      label: 'Restaurant & Bar',
                      icon: Icon(
                        Icons.restaurant_rounded,
                      ),
                    ),
                    BottomNavigationBarItem(
                      label: 'Facilities',
                      icon: Icon(
                        Icons.supervised_user_circle_rounded,
                      ),
                    ),
                    BottomNavigationBarItem(
                      label: 'Weeding & Events',
                      icon: Icon(
                        Icons.event_available_rounded,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
