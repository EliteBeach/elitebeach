import 'package:elite_beach/core/utils/helper.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/gaps.dart';

class CustomGalleryListView extends StatelessWidget {
  const CustomGalleryListView(
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
        const Divider(),
        SizedBox(
          height: context.screenHeight * .25,
          child: ListView.builder(
            itemCount: 40,
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: context.screenWidth * .01,
                ),
                child: Image.asset(
                  testImgSrc,
                ),
              );
            },
          ),
        ),
        Gaps.vGap16,
      ],
    );
  }
}
