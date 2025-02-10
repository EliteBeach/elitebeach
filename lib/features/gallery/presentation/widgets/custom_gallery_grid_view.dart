import 'package:elite_beach/core/utils/constants.dart';
import 'package:elite_beach/core/utils/helper.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/gaps.dart';

class CustomGalleryGridView extends StatelessWidget {
  const CustomGalleryGridView(
      {super.key, required this.galleryTitle, required this.testImgListSrc});
  final String galleryTitle;
  final List<String> testImgListSrc;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, kGalleryDetailsMobileScreenRoute,
            arguments: testImgListSrc);
      },
      child: Column(
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
                itemCount: testImgListSrc.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 5,
                  crossAxisSpacing: 0,
                  mainAxisSpacing: 10,
                  childAspectRatio: 1,
                  mainAxisExtent: 70,
                ),
                itemBuilder: (context, index) {
                  return Image.asset(
                    testImgListSrc[index],
                    fit: BoxFit.cover,
                  );
                },
              )),
          Gaps.vGap16,
        ],
      ),
    );
  }
}
