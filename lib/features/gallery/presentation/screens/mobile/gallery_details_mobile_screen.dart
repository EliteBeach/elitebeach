import 'package:flutter/material.dart';
import 'package:photo_view/photo_view_gallery.dart';

class GalleryDetailsMobileScreen extends StatelessWidget {
  const GalleryDetailsMobileScreen({super.key, required this.imagesListPath});
  final List<String> imagesListPath;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: PhotoViewGallery.builder(
        itemCount: imagesListPath.length,
        builder: (context, index) {
          return PhotoViewGalleryPageOptions(
            imageProvider: AssetImage(
              imagesListPath[index],
            ),
            tightMode: true,
          );
        },
      ),
    );
  }
}
