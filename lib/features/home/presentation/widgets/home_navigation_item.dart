import 'package:elite_beach/core/utils/helper.dart';
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
    return TextButton(
      style:
          const ButtonStyle(overlayColor: WidgetStatePropertyAll(Colors.grey)),
      onPressed: () {},
      child: Text(
        itemName,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          //  fontFamily: 'EduAUVICWANTPre',
          fontSize: context.screenWidth * .01,
        ),
      ),
    );
  }
}
