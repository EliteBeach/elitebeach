import 'package:elite_beach/core/utils/helper.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view_gallery.dart';

import '../../../data/models/housing_units.dart';

class HousingDetailsScreenMobile extends StatelessWidget {
  const HousingDetailsScreenMobile({
    super.key,
    required this.housingUnitModel,
  });
  final HousingUnitModel housingUnitModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffB0BDC0),
      appBar: AppBar(
        backgroundColor: const Color(0xffB0BDC0),
        centerTitle: true,
        title: Text(
          context.locale.translate(housingUnitModel.title)!,
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: context.screenHeight * .4,
            child: ListView.builder(
                itemCount: housingUnitModel.unitImages.length,
                padding: const EdgeInsetsDirectional.symmetric(horizontal: 8),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                    ),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return PhotoViewGallery.builder(
                                itemCount: housingUnitModel.unitImages.length,
                                builder: (context, index) {
                                  return PhotoViewGalleryPageOptions(
                                      imageProvider: AssetImage(
                                        housingUnitModel.unitImages[index],
                                      ),
                                      gestureDetectorBehavior:
                                          HitTestBehavior.opaque);
                                },
                              );
                            },
                          ),
                        );
                      },
                      child: Image.asset(
                        housingUnitModel.unitImages[index],
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
