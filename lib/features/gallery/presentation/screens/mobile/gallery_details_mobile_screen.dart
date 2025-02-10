import 'package:flutter/material.dart';

class GalleryDetailsMobileScreen extends StatelessWidget {
  const GalleryDetailsMobileScreen({super.key, required this.imagesListPath});
  final List<String> imagesListPath;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          itemCount: imagesListPath.length,
          itemBuilder: (context, index) {
            return InteractiveViewer(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Image.asset(
                  imagesListPath[index],
                ),
              ),
            );
          }),
    );
  }
}
