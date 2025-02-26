import 'package:elite_beach/core/utils/helper.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomMoreItem extends StatelessWidget {
  CustomMoreItem(
      {super.key,
      this.subtitle,
      required this.iconData,
      required this.title,
      required this.trailingIcon,
      required this.tapHandler,
      required this.iconColor});
  final IconData iconData;
  final String title;
  final IconData trailingIcon;
  final Function tapHandler;
  final Color iconColor;
  String? subtitle;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        tapHandler();
      },
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      tileColor: Colors.white,
      title: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: subtitle != null
          ? Text(
              subtitle!,
              style: TextStyle(
                fontSize: context.screenWidth * .02,
              ),
            )
          : null,
      trailing: Icon(trailingIcon),
      leading: Icon(
        iconData,
        color: Colors.green,
      ),
    );
  }
}
