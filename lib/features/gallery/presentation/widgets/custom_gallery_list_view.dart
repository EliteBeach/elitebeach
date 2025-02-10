import 'package:elite_beach/core/utils/helper.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/gaps.dart';

class CustomGalleryGridView extends StatelessWidget {
  const CustomGalleryGridView(
      {super.key, required this.galleryTitle, required this.testImgSrc});
  final String galleryTitle;
  final String testImgSrc;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          galleryTitle,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: context.screenWidth * .035,
          ),
        ),
        const Divider(
          color: Colors.white,
          height: 2,
        ),
        SizedBox(
          height: context.screenHeight * .01,
        ),
        SizedBox(
            height: context.screenHeight * .3,
            child: GridView.builder(
              itemCount: 10,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 0,
                mainAxisSpacing: 10,
                childAspectRatio: 1,
                mainAxisExtent: 100,
              ),
              itemBuilder: (context, index) {
                return Image.asset(
                  testImgSrc,
                );
              },
            )),
        Gaps.vGap16,
      ],
    );
  }
}
