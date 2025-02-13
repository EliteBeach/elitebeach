import 'package:elite_beach/core/utils/constants.dart';
import 'package:elite_beach/core/utils/helper.dart';
import 'package:flutter/material.dart';

class CustomGalleryItem extends StatelessWidget {
  const CustomGalleryItem({
    super.key,
    required this.galleryTitle,
  });
  final String galleryTitle;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, kGalleryDetailsMobileScreenRoute,
            arguments: galleryTitle);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            context.locale.translate(galleryTitle)!,
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
            height: context.screenHeight * .03,
          ),
          // SizedBox(
          //     height: context.screenHeight * .3,
          //     child: GridView.builder(
          //       physics: const NeverScrollableScrollPhysics(),
          //       itemCount: testImgListSrc.length,
          //       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          //         crossAxisCount: 5,
          //         crossAxisSpacing: 0,
          //         mainAxisSpacing: 10,
          //         childAspectRatio: 1,
          //         mainAxisExtent: 70,
          //       ),
          //       itemBuilder: (context, index) {
          //         return Image.asset(
          //           testImgListSrc[index],
          //           fit: BoxFit.cover,
          //         );
          //       },
          //     )),
          // Gaps.vGap16,
        ],
      ),
    );
  }
}
