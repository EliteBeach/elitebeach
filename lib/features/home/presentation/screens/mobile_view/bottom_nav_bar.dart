import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
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
    );
  }
}
