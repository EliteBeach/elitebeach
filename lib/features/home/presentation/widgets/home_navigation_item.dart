import 'package:flutter/material.dart';

class HomeNavigationItem extends StatelessWidget {
  const HomeNavigationItem({
    super.key,
    required this.itemName,
    required this.tapHandler,
  });
  final Function tapHandler;
  final String itemName;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Text(
        itemName,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontFamily: 'EduAUVICWANTPre',
        ),
      ),
      onTap: () {
        tapHandler();
      },
    );
  }
}
