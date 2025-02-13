import 'package:flutter/material.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class GalleryDetailsMobileScreen extends StatelessWidget {
  const GalleryDetailsMobileScreen({super.key, required this.galleryTitle});
  final String galleryTitle;

  @override
  Widget build(BuildContext context) {
    //fetch images
    SupabaseStreamFilterBuilder imagesTable = Supabase.instance.client
        .from('gallery_images')
        .stream(primaryKey: ['id']);
    return Scaffold(
      appBar: AppBar(),
      body: StreamBuilder(
          stream: imagesTable,
          builder: (context, snapshot) {
            return snapshot.data == null
                ? const Center(child: CircularProgressIndicator())
                : GridView.builder(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                    itemCount: snapshot.data!.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: 1,
                      mainAxisExtent: 100,
                    ),
                    itemBuilder: (context, index) {
                      return snapshot.data![index][galleryTitle].toString() ==
                              ''
                          ? const SizedBox()
                          : InkWell(
                              onTap: () {
                                snapshot.data![index][galleryTitle] != null
                                    ? Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) {
                                            return Stack(
                                              children: [
                                                PhotoViewGallery.builder(
                                                  itemCount:
                                                      snapshot.data!.length,
                                                  builder: (context, index) {
                                                    return PhotoViewGalleryPageOptions(
                                                        errorBuilder: (context,
                                                            error, stackTrace) {
                                                          return const Text(
                                                              'Invalid Image');
                                                        },
                                                        imageProvider:
                                                            NetworkImage(
                                                          snapshot.data![index]
                                                              [galleryTitle],
                                                        ),
                                                        gestureDetectorBehavior:
                                                            HitTestBehavior
                                                                .opaque);
                                                  },
                                                ),
                                                IconButton(
                                                    onPressed: () {
                                                      Navigator.pop(context);
                                                    },
                                                    icon: const Icon(
                                                        Icons.arrow_back)),
                                              ],
                                            );
                                          },
                                        ),
                                      )
                                    : null;
                              },
                              child: snapshot.data![index][galleryTitle] == null
                                  ? const SizedBox()
                                  : Image.network(
                                      snapshot.data![index][galleryTitle],
                                      fit: BoxFit.cover,
                                      errorBuilder:
                                          (context, error, stackTrace) {
                                        return const Center(
                                            child: Text('Invalid Image'));
                                      },
                                    ),
                            );
                    },
                  );
          }),
      // Gaps.vGap16,
    );
  }
}
