import 'package:cached_network_image/cached_network_image.dart';
import 'package:elite_beach/core/utils/assets.dart';
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
        .stream(primaryKey: ['id'])
        .order('id', ascending: true) // ✅ ترتيب البيانات حسب ID
        .map((event) => event
            .where((image) =>
                image[galleryTitle] != null &&
                image[galleryTitle] != 'null' &&
                image[galleryTitle].toString().isNotEmpty)
            .toList());

    return Scaffold(
      appBar: AppBar(title: Text(galleryTitle)),
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
              String imageUrl = snapshot.data![index][galleryTitle];

              // تحويل http إلى https لو لزم الأمر
              if (imageUrl.startsWith('http://')) {
                imageUrl = imageUrl.replaceFirst('http://', 'https://');
              }

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
                                String fullImageUrl =
                                    snapshot.data![i][galleryTitle];
                                if (fullImageUrl.startsWith('http://')) {
                                  fullImageUrl = fullImageUrl.replaceFirst(
                                      'http://', 'https://');
                                }
                                return PhotoViewGalleryPageOptions(
                                  imageProvider: NetworkImage(fullImageUrl),
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
                child: CachedNetworkImage(
                  imageUrl: imageUrl,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => Center(
                      child: Image.asset(
                    AssetsData.eliteLogo,
                  )), // تحميل مؤقت
                  errorWidget: (context, url, error) => const Center(
                      child: Text('خطأ في التحميل')), // في حالة فشل التحميل
                ),
              );
            },
          );
        },
      ),
    );
  }
}
