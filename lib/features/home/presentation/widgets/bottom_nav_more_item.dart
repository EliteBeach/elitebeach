import 'package:elite_beach/core/utils/helper.dart';
import 'package:flutter/material.dart';

class BottomNavMoreItem extends StatelessWidget {
  const BottomNavMoreItem(
      {super.key, required this.icon, required this.iconName});
  final IconData icon;
  final String iconName;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topRight,
      padding: EdgeInsets.all(
        context.screenWidth * .02,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          20,
        ),
      ),
      child: TextButton.icon(
        iconAlignment: IconAlignment.end,
        label: Text(
          iconName,
          style: TextStyle(
            fontSize: context.screenWidth * .028,
            color: Colors.black87,
            fontWeight: FontWeight.bold,
            fontFamily: 'EduAUVICWANTPre',
          ),
        ),
        onPressed: () {},
        icon: Icon(
          icon,
          size: context.screenWidth * .06,
          color: Colors.black54,
        ),
      ),
    );
  }
}
