import 'package:flutter/material.dart';

class SocialMediaItem extends StatelessWidget {
  const SocialMediaItem(
      {super.key, required this.imagePath, required this.tapHandler});
  final String imagePath;
  final Function tapHandler;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        tapHandler();
      },
      child: Image.asset(
        color: Colors.white,
        width: 20,
        height: 20,
        imagePath,
      ),
    );
  }
}
