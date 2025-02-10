import 'package:flutter/material.dart';

class GalleryDetailsMobileScreen extends StatelessWidget {
  const GalleryDetailsMobileScreen({super.key, required this.imagesListPath});
  final List<String> imagesListPath;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
          itemCount: imagesListPath.length,
          itemBuilder: (context, index) {
            return InteractiveViewer(child: Image.asset(imagesListPath[index]));
          }),
    );
  }
}
