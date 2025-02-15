import 'package:animate_do/animate_do.dart';
import 'package:elite_beach/core/utils/assets.dart';
import 'package:elite_beach/core/utils/gaps.dart';
import 'package:elite_beach/core/utils/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../home/presentation/screens/mobile_view/bottom_nav_bar.dart';
import '../../../../splash/presentation/manger/locale_cubit/locale_cubit.dart';
import '../../widgets/custom_facility_widget.dart';
import '../../widgets/custom_section_widget.dart';

class FacilitiesMobileScreen extends StatelessWidget {
  const FacilitiesMobileScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
          //   FacilityScreenBody
          Expanded(
            child: ListView(
              children: [
                //Great for your stay
                CustomFacilityWidget(
                  title: context.locale.translate('great_facilities')!,
                  facilities: [
                    FacilityItem(
                      icon: Icons.restaurant,
                      text: context.locale.translate('restaurant')!,
                    ),
                    FacilityItem(
                        icon: Icons.bathtub,
                        text: context.locale.translate('private_bathroom')!),
                    FacilityItem(
                        icon: Icons.bathroom,
                        text: context.locale.translate('shower')!),
                    FacilityItem(
                        icon: Icons.local_parking,
                        text: context.locale.translate('on_site_parking')!),
                    FacilityItem(
                        icon: Icons.ac_unit,
                        text: context.locale.translate('air_conditioning')!),
                    FacilityItem(
                        icon: Icons.tv,
                        text: context.locale.translate('flat_screen_tv')!),
                    FacilityItem(
                        icon: Icons.room_service,
                        text: context.locale.translate('room_service')!),
                    FacilityItem(
                        icon: Icons.balcony,
                        text: context.locale.translate('balcony')!),
                  ],
                ),
                CustomFacilityWidget(
                  title: context.locale.translate('most_popular_facilities')!,
                  facilities: [
                    FacilityItem(
                        icon: Icons.pool_rounded,
                        text: context.locale.translate('swimming_pool')!),
                    FacilityItem(
                        icon: Icons.child_care_rounded,
                        text: context.locale.translate('kids_Area')!),
                    FacilityItem(
                        icon: Icons.emoji_food_beverage_outlined,
                        text: context.locale.translate('beverages')!),
                    FacilityItem(
                        icon: Icons.bathroom_outlined,
                        text: context.locale.translate('day_use_bathroom')!),
                    FacilityItem(
                        icon: Icons.beach_access_rounded,
                        text: context.locale.translate('private_beach_area')!),
                    FacilityItem(
                        icon: Icons.smart_toy_rounded,
                        text: context.locale.translate('arcade_zone')!),
                  ],
                ),
                // Section Widget
                SectionWidget(
                  icon: Icons.bathtub,
                  title: context.locale.translate('private_bathroom')!,
                  items: [
                    context.locale.translate('toilet_paper')!,
                    context.locale.translate('towels')!,
                    context.locale.translate('bidet')!,
                    context.locale.translate('toilet')!,
                    context.locale.translate('toiletries')!,
                    context.locale.translate('shower')!,
                  ],
                ),
                SectionWidget(
                  icon: Icons.bed,
                  title: context.locale.translate('bedroom')!,
                  items: [
                    context.locale.translate('bed_linen')!,
                    context.locale.translate('wardrobe')!,
                    context.locale.translate('bedroom')!,
                  ],
                ),
                SectionWidget(
                  icon: Icons.park,
                  title: context.locale.translate('outdoor_activities')!,
                  items: [
                    context.locale.translate('volleyball_court')!,
                    context.locale.translate('speedball')!,
                    context.locale.translate('aqua_park')!,
                    context.locale.translate('swimming_pool')!,
                    context.locale.translate('private_beach_area')!,
                    context.locale.translate('kids_Area')!,
                    context.locale.translate('arcade_zone')!,
                    context.locale.translate('restaurant')!,
                    context.locale.translate('balcony')!,
                    context.locale.translate('night_movies')!,
                  ],
                ),

                SectionWidget(
                  icon: Icons.park,
                  title: context.locale.translate('american_kitchen')!,
                  items: [
                    context.locale.translate('electric_kettle')!,
                    context.locale.translate('microwave')!,
                    context.locale.translate('fridge')!,
                    context.locale.translate('cooking_utensils')!,
                  ],
                ),
                SectionWidget(
                  icon: Icons.park,
                  title: context.locale.translate('on_site_parking')!,
                  items: const [],
                ),
                SectionWidget(
                  icon: Icons.circle_notifications_rounded,
                  title: context.locale.translate('reception_services')!,
                  items: [
                    context.locale.translate('invoice_available')!,
                    context.locale.translate('atm_on_site')!,
                    context.locale.translate('front_desk_24h')!,
                  ],
                ),
                SectionWidget(
                  icon: Icons.dry_cleaning_rounded,
                  title: context.locale.translate('cleaning_services')!,
                  items: [
                    context.locale.translate('ironing_service')!,
                    context.locale.translate('laundry_facilities')!,
                    context.locale.translate('daily_housekeeping')!,
                  ],
                ),
                SectionWidget(
                  icon: Icons.security_rounded,
                  title: context.locale.translate('security_safety')!,
                  items: [
                    context.locale.translate('fire_extinguishers')!,
                    context.locale.translate('cctv_cameras')!,
                    context.locale.translate('security_24h')!,
                  ],
                ),
              ],
            ),
          ),
          Gaps.vGap10,
          const BottomNavBar(),
        ],
      ),
    );
  }
}
