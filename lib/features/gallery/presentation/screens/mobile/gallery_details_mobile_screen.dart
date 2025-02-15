import 'package:cached_network_image/cached_network_image.dart';
import 'package:elite_beach/core/utils/assets.dart';
import 'package:elite_beach/core/utils/helper.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class GalleryDetailsMobileScreen extends StatefulWidget {
  const GalleryDetailsMobileScreen({super.key, required this.galleryTitle});
  final String galleryTitle;

  @override
  State<GalleryDetailsMobileScreen> createState() =>
      _GalleryDetailsMobileScreenState();
}

class _GalleryDetailsMobileScreenState
    extends State<GalleryDetailsMobileScreen> {
  late final Stream<List<Map<String, dynamic>>> _imagesStream;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _imagesStream = Supabase.instance.client
        .from('gallery_images')
        .stream(primaryKey: ['id'])
        .order('id', ascending: true)
        .map((event) => event
            .where((image) =>
                image.containsKey(widget.galleryTitle) &&
                image[widget.galleryTitle] != 'null' &&
                image[widget.galleryTitle].toString().isNotEmpty)
            .toList());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(title: Text(context.locale.translate(widget.galleryTitle)!)),
      body: StreamBuilder<List<Map<String, dynamic>>>(
        stream: _imagesStream,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return const Center(
                child: Text('حدث خطأ أثناء تحميل الصور، حاول مرة أخرى.'));
          }
          if (snapshot.data == null || snapshot.data!.isEmpty) {
            return const Center(child: Text('لا توجد صور متاحة.'));
          }

          return GridView.builder(
            controller: _scrollController,
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
              String? imageUrl = snapshot.data![index][widget.galleryTitle];

              return InkWell(
                onTap: () => _openImageGallery(context, snapshot.data!, index),
                child: CachedNetworkImage(
                  imageUrl: imageUrl ?? '',
                  fit: BoxFit.cover,
                  placeholder: (context, url) => Center(
                    child: Image.asset(AssetsData.eliteLogo),
                  ),
                  errorWidget: (context, url, error) => Center(
                    child: Image.asset(AssetsData.eliteLogo),
                  ),
                  // تحميل الصور تدريجيًا بدل من تحميلهم دفعة واحدة
                  fadeInDuration: const Duration(milliseconds: 300),
                  fadeOutDuration: const Duration(milliseconds: 300),
                  memCacheHeight: 150, // تقليل استهلاك الذاكرة
                  memCacheWidth: 150,
                ),
              );
            },
          );
        },
      ),
    );
  }

  void _openImageGallery(BuildContext context,
      List<Map<String, dynamic>> images, int initialIndex) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return Stack(
            children: [
              PhotoViewGallery.builder(
                itemCount: images.length,
                pageController: PageController(initialPage: initialIndex),
                builder: (context, index) {
                  String? fullImageUrl = images[index][widget.galleryTitle];

                  return PhotoViewGalleryPageOptions(
                    imageProvider:
                        fullImageUrl != null && fullImageUrl.isNotEmpty
                            ? NetworkImage(fullImageUrl)
                            : const AssetImage(AssetsData.eliteLogo)
                                as ImageProvider,
                    heroAttributes: PhotoViewHeroAttributes(
                        tag: fullImageUrl ?? 'default_tag'),
                    errorBuilder: (context, error, stackTrace) =>
                        Image.asset(AssetsData.eliteLogo),
                    gestureDetectorBehavior: HitTestBehavior.opaque,
                  );
                },
              ),
              Positioned(
                top: 40,
                left: 20,
                child: IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.arrow_back, color: Colors.white),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
