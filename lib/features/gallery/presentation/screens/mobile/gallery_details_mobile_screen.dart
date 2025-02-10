import 'package:flutter/material.dart';
import 'package:photo_view/photo_view_gallery.dart';

class GalleryDetailsMobileScreen extends StatelessWidget {
  const GalleryDetailsMobileScreen({super.key, required this.imagesListPath});
  final List<String> imagesListPath;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: GridView.builder(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
        ),
        itemCount: imagesListPath.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 1,
          mainAxisExtent: 100,
        ),
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return PhotoViewGallery.builder(
                      itemCount: imagesListPath.length,
                      builder: (context, index) {
                        return PhotoViewGalleryPageOptions(
                            imageProvider: AssetImage(
                              imagesListPath[index],
                            ),
                            gestureDetectorBehavior: HitTestBehavior.opaque);
                      },
                    );
                  },
                ),
              );
            },
            child: Image.asset(
              imagesListPath[index],
              fit: BoxFit.cover,
            ),
          );
        },
      ),
      // Gaps.vGap16,
    );
  }
}
