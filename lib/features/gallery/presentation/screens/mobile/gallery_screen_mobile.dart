import 'package:animate_do/animate_do.dart';
import 'package:elite_beach/core/utils/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/assets.dart';
import '../../../../home/presentation/screens/mobile_view/bottom_nav_bar.dart';
import '../../../../splash/presentation/manger/locale_cubit/locale_cubit.dart';
import '../../../data/models/gallery_model.dart';
import '../../widgets/custom_gallery_item.dart';

class GalleryScreenMobile extends StatelessWidget {
  const GalleryScreenMobile({super.key});

  @override
  Widget build(BuildContext context) {
    GalleryModel galleryModel = GalleryModel();
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: context.screenWidth * .05,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FadeIn(
            duration: const Duration(seconds: 2),
            child: Row(
              children: [
                Image.asset(
                  AssetsData.eliteLogoNoBg,
                  width: context.screenWidth * .15,
                  height: context.screenHeight * .15,
                  color: Colors.black,
                ),
                const Spacer(),
                Text(
                  context.locale.translate('elite_gallery')!,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: context.screenWidth * .04,
                  ),
                ),
                const Spacer(),
                InkWell(
                  onTap: () {
                    context.locale.isEnLocale
                        ? BlocProvider.of<LocaleCubit>(context).toArabic()
                        : BlocProvider.of<LocaleCubit>(context).toEnglish();
                  },
                  child: FadeIn(
                    duration: const Duration(seconds: 2),
                    child: Container(
                      padding: EdgeInsets.all(context.screenHeight * .01),
                      decoration: BoxDecoration(
                          color: Colors.transparent.withOpacity(
                            .07,
                          ),
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        children: [
                          const Icon(Icons.language_rounded),
                          SizedBox(
                            height: context.screenHeight * .01,
                          ),
                          Text(
                            context.locale.isEnLocale ? 'ع' : 'En',
                            style: TextStyle(
                              fontSize: context.screenWidth * .025,
                              letterSpacing: context.locale.isEnLocale
                                  ? context.screenWidth * .005
                                  : null,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              //  fontFamily: 'EduAUVICWANTPre',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: context.screenHeight * .03,
          ),
          //Images list view
          SizedBox(
            height: context.screenHeight * .7,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FadeInRight(
                    child: CustomGalleryItem(
                      galleryTitle: context.locale.translate('pool_deck')!,
                      testImgListSrc: galleryModel.poolDeckImagesList,
                    ),
                  ),
                  FadeInLeft(
                    child: CustomGalleryItem(
                      galleryTitle: context.locale.translate('beach')!,
                      testImgListSrc: galleryModel.beachImagesList,
                    ),
                  ),
                  FadeInRight(
                    child: CustomGalleryItem(
                      galleryTitle: context.locale.translate('hotel')!,
                      testImgListSrc: galleryModel.hotelImagesList,
                    ),
                  ),
                  FadeInLeft(
                    child: CustomGalleryItem(
                      galleryTitle: context.locale.translate('chalets')!,
                      testImgListSrc: galleryModel.chaletsImagesList,
                    ),
                  ),
                  FadeInRight(
                    child: CustomGalleryItem(
                      galleryTitle: context.locale.translate('studios')!,
                      testImgListSrc: galleryModel.studiosImagesList,
                    ),
                  ),
                  FadeInLeft(
                    child: CustomGalleryItem(
                      galleryTitle: context.locale.translate('restaurant')!,
                      testImgListSrc: galleryModel.restaurantImagesList,
                    ),
                  ),
                  FadeInRight(
                    child: CustomGalleryItem(
                      testImgListSrc: galleryModel.superMarketImagesList,
                      galleryTitle: context.locale.translate('super_market')!,
                    ),
                  ),
                  FadeInLeft(
                    child: CustomGalleryItem(
                      galleryTitle: context.locale.translate('arcade_zone')!,
                      testImgListSrc: galleryModel.arcadeZoneImagesList,
                    ),
                  ),
                  FadeInRight(
                    child: CustomGalleryItem(
                      galleryTitle: context.locale.translate('kids_Area')!,
                      testImgListSrc: galleryModel.kidsAreaImagesList,
                    ),
                  ),
                  FadeInLeft(
                    child: CustomGalleryItem(
                      galleryTitle: context.locale.translate('events')!,
                      testImgListSrc: galleryModel.eventsImagesList,
                    ),
                  ),
                ],
              ),
            ),
          ),

          const Spacer(),
          const BottomNavBar(),
        ],
      ),
    );
  }
}
