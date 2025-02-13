import 'package:flutter/material.dart';

class CustomDescriptionItem extends StatelessWidget {
  const CustomDescriptionItem(
      {super.key, required this.icon, required this.descriptionTxt});
  final IconData icon;
  final String descriptionTxt;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    );
  }
}
