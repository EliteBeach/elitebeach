import 'package:elite_beach/core/utils/helper.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class GalleryDetailsMobileScreen extends StatelessWidget {
  const GalleryDetailsMobileScreen({super.key, required this.galleryTitle});
  final String galleryTitle;

  @override
  Widget build(BuildContext context) {
    final Stream<List<Map<String, dynamic>>> imagesTable = Supabase
        .instance.client
        .from('gallery_images')
        .stream(primaryKey: ['id']).map((event) => event
            .where((image) =>
                image[galleryTitle] != null &&
                image[galleryTitle] != 'null' &&
                image[galleryTitle].toString().isNotEmpty)
            .toList()); // ✅ تصفية الصور الفارغة

    return Scaffold(
      appBar: AppBar(title: Text(context.locale.translate(galleryTitle)!)),
      body: StreamBuilder<List<Map<String, dynamic>>>(
        stream: imagesTable,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return const Center(child: Text('حدث خطأ أثناء تحميل الصور'));
          }
          if (snapshot.data == null || snapshot.data!.isEmpty) {
            return const Center(child: Text('لا توجد صور متاحة'));
          }

          return GridView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            itemCount: snapshot.data!.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 1,
              mainAxisExtent: 100,
            ),
            itemBuilder: (context, index) {
              final imageUrl = snapshot.data![index][galleryTitle];

              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return Stack(
                          children: [
                            PhotoViewGallery.builder(
                              itemCount: snapshot.data!.length,
                              pageController:
                                  PageController(initialPage: index),
                              builder: (context, i) {
                                return PhotoViewGalleryPageOptions(
                                  imageProvider: NetworkImage(
                                      snapshot.data![i][galleryTitle]),
                                  errorBuilder: (context, error, stackTrace) =>
                                      const Center(
                                          child: Text('خطأ في تحميل الصورة')),
                                  gestureDetectorBehavior:
                                      HitTestBehavior.opaque,
                                );
                              },
                            ),
                            Positioned(
                              top: 40,
                              left: 20,
                              child: IconButton(
                                onPressed: () => Navigator.pop(context),
                                icon: const Icon(Icons.arrow_back,
                                    color: Colors.white),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  );
                },
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) =>
                      const Center(child: Text('خطأ في التحميل')),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
