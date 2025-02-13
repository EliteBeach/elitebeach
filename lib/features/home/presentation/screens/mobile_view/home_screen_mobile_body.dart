import 'package:animate_do/animate_do.dart';
import 'package:elite_beach/core/utils/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/assets.dart';
import '../../../../splash/presentation/manger/locale_cubit/locale_cubit.dart';
import 'bottom_nav_bar.dart';

class HomeScreenMobileBody extends StatelessWidget {
  const HomeScreenMobileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          AssetsData.homeImage,
          fit: BoxFit.cover,
          height: context.screenHeight,
          width: context.screenWidth,
        ),
        Positioned(
          left: 0,
          right: 0,
          top: context.screenHeight * .5,
          bottom: 0,
          child: FadeIn(
            duration: const Duration(seconds: 3),
            child: Column(
              children: [
                Text(
                  context.locale.translate('welcome_txt')!,
                  style: TextStyle(
                    letterSpacing: context.locale.isEnLocale
                        ? context.screenWidth * .005
                        : null,
                    fontSize: context.screenWidth * .04,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    //   fontFamily: 'EduAUVICWANTPre',
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: context.screenWidth * .05),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    AssetsData.eliteLogoNoBg,
                    width: context.screenWidth * .15,
                    height: context.screenHeight * .15,
                    color: Colors.white,
                  ),
                  const Spacer(),
                  InkWell(
                    onTap: () {
                      context.locale.isEnLocale
                          ? BlocProvider.of<LocaleCubit>(context).toArabic()
                          : BlocProvider.of<LocaleCubit>(context).toEnglish();
                    },
                    child: FadeInDown(
                      duration: const Duration(seconds: 3),
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

              const BottomNavBar(),
              // Column(
              //   children: [
              //     BlocBuilder<BottomNavCubit, BottomNavCubitState>(
              //       builder: (context, state) {
              //         return BlocProvider.of<BottomNavCubit>(context).isActive
              //             ? FadeInUp(
              //                 duration: const Duration(seconds: 1),
              //                 child: Column(
              //                   children: [
              //                     BottomNavMoreItem(
              //                       icon: Icons.local_offer_rounded,
              //                       iconName:
              //                           context.locale.translate('offers')!,
              //                     ),
              //                     BottomNavMoreItem(
              //                       icon: Icons.restaurant_rounded,
              //                       iconName:
              //                           context.locale.translate('rest&bar')!,
              //                     ),
              //                     BottomNavMoreItem(
              //                       icon: Icons.supervised_user_circle_rounded,
              //                       iconName:
              //                           context.locale.translate('facilities')!,
              //                     ),
              //                     BottomNavMoreItem(
              //                       icon: Icons.event_available_rounded,
              //                       iconName: context.locale
              //                           .translate('weeding&events')!,
              //                     ),
              //                   ],
              //                 ),
              //               )
              //             : const SizedBox();
              //       },
              //     ),

              //   ],
              // ),
            ],
          ),
        ),
      ],
    );
  }
}
