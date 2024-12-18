import 'package:flutter/material.dart';

class SocialMediaItem extends StatelessWidget {
  const SocialMediaItem(
      {super.key, required this.imagePath, required this.tapHandler});
  final String imagePath;
  final Function tapHandler;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      hoverColor: Colors.orange,
      onPressed: () {},
      icon: Image.asset(
        color: Colors.white,
        width: 20,
        height: 20,
        imagePath,
      ),
    );
  }
}
