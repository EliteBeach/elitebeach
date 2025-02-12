import 'package:animate_do/animate_do.dart';
import 'package:elite_beach/core/utils/assets.dart';
import 'package:elite_beach/core/utils/gaps.dart';
import 'package:elite_beach/core/utils/helper.dart';
import 'package:elite_beach/features/facilities/presentation/widgets/custom_facility_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../../../../core/utils/functions/fetch_images_cloudinary_function.dart';
import '../../../../home/presentation/screens/mobile_view/bottom_nav_bar.dart';
import '../../../../splash/presentation/manger/locale_cubit/locale_cubit.dart';

class FacilitiesMobileScreen extends StatelessWidget {
  const FacilitiesMobileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> images = [];

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
                  context.locale.translate('facilities')!,
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
          // Facilities body
          CustomFacilityItem(
            iconData: Icons.restaurant_menu_rounded,
            title: context.locale.translate('restaurant')!,
            trailing: context.locale.translate('rest_menu')!,
            tapHandler: () async {
              await fetchImages(folderName: 'test')
                  .then((value) => images.addAll(value));
              showDialog(
                  context: context,
                  builder: (ctx) {
                    return Dialog(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      child: Image.network(images[0]),
                    );
                  });
            },
            iconColor: Colors.green,
          ),
          Gaps.vGap10,
          CustomFacilityItem(
            iconData: Icons.emoji_food_beverage_sharp,
            title: context.locale.translate('beverages')!,
            trailing: context.locale.translate('bev_menu')!,
            tapHandler: () {
              launchUrlString("https://imgur.com/a/xYettxr");
            },
            iconColor: Colors.green,
          ),
          Gaps.vGap10,
          CustomFacilityItem(
            iconData: Icons.shopping_cart_rounded,
            title: context.locale.translate('super_market')!,
            subtitle: context.locale.translate('sup_market_subtitle')!,
            trailing: context.locale.translate('call_now')!,
            tapHandler: () {
              launchUrlString("tel://01003783804");
            },
            iconColor: Colors.green,
          ),
          Gaps.vGap10,
          CustomFacilityItem(
            iconData: Icons.call,
            title: context.locale.translate('tele_dir')!,
            trailing: context.locale.translate('rest_menu')!,
            tapHandler: () {
              showDialog(
                  context: context,
                  builder: (ctx) {
                    return Dialog(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      child: Image.asset(AssetsData.teleDir),
                    );
                  });
            },
            iconColor: Colors.green,
          ),
          const Spacer(),
          const BottomNavBar(),
        ],
      ),
    );
  }
}
