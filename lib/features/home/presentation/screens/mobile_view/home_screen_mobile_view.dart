import 'package:animate_do/animate_do.dart';
import 'package:elite_beach/core/utils/helper.dart';
import 'package:elite_beach/features/home/presentation/manager/cubit/bottom_nav_cubit_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/assets.dart';
import '../../../../../core/utils/functions/setup_service_locator.dart';
import '../../../../splash/presentation/manger/locale_cubit/locale_cubit.dart';
import '../../widgets/bottom_nav_more_item.dart';
import 'bottom_nav_bar.dart';

class HomeScreenMobileView extends StatelessWidget {
  const HomeScreenMobileView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<BottomNavCubit>(),
      child: BlocBuilder<BottomNavCubit, BottomNavCubitState>(
        builder: (context, state) {
          return Scaffold(
            body: Stack(
              children: [
                Image.asset(
                  AssetsData.homeImage,
                  fit: BoxFit.cover,
                  height: context.screenHeight,
                  width: context.screenWidth,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: context.screenWidth * .05),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            AssetsData.eliteLogoNoBg,
                            width: context.screenWidth * .15,
                            height: context.screenHeight * .15,
                            color: Colors.white,
                          ),
                          const Spacer(),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                alignment: Alignment.center,
                                padding: const EdgeInsets.only(
                                  bottom: 5, // Space between underline and text
                                ),
                                decoration: const BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                      color: Colors.white,
                                      width: 1.0, // Underline thickness
                                    ),
                                  ),
                                ),
                                child: Text(
                                  context.locale
                                      .translate('elite_beach_res&hotel')!,
                                  style: TextStyle(
                                    letterSpacing: context.screenWidth * .005,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'EduAUVICWANTPre',
                                    fontSize: context.screenWidth * .035,
                                  ),
                                ),
                              )
                            ],
                          ),
                          const Spacer(),
                          InkWell(
                            onTap: () {
                              context.locale.isEnLocale
                                  ? BlocProvider.of<LocaleCubit>(context)
                                      .toArabic()
                                  : BlocProvider.of<LocaleCubit>(context)
                                      .toEnglish();
                            },
                            child: FadeInDown(
                              duration: const Duration(seconds: 3),
                              child: Container(
                                padding:
                                    EdgeInsets.all(context.screenHeight * .01),
                                decoration: BoxDecoration(
                                    color: Colors.grey,
                                    borderRadius: BorderRadius.circular(20)),
                                child: Column(
                                  children: [
                                    const Icon(Icons.language_rounded),
                                    SizedBox(
                                      height: context.screenHeight * .01,
                                    ),
                                    Text(
                                      context.locale.isEnLocale ? 'ع' : 'En',
                                      style: const TextStyle(
                                        fontSize: 16,
                                        letterSpacing: 4,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'EduAUVICWANTPre',
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      const Spacer(),
                      FadeIn(
                        duration: const Duration(seconds: 3),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              context.locale.translate('discover_with_us')!,
                              style: TextStyle(
                                fontSize: context.screenWidth * .02,
                                letterSpacing: 4,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'EduAUVICWANTPre',
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            BlocBuilder<LocaleCubit, LocaleState>(
                              builder: (context, state) {
                                return Text(
                                  context.locale.translate('welcome_txt')!,
                                  style: TextStyle(
                                    letterSpacing: 4,
                                    fontSize: context.screenWidth * .03,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'EduAUVICWANTPre',
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                      const Spacer(),
                      SizedBox(
                        height: context.screenHeight * .05,
                      ),
                      Column(
                        children: [
                          BlocBuilder<BottomNavCubit, BottomNavCubitState>(
                            builder: (context, state) {
                              return BlocProvider.of<BottomNavCubit>(context)
                                      .isActive
                                  ? FadeInUp(
                                      duration: const Duration(seconds: 1),
                                      child: Column(
                                        children: [
                                          BottomNavMoreItem(
                                            icon: Icons.local_offer_rounded,
                                            iconName: context.locale
                                                .translate('offers')!,
                                          ),
                                          BottomNavMoreItem(
                                            icon: Icons.restaurant_rounded,
                                            iconName: context.locale
                                                .translate('rest&bar')!,
                                          ),
                                          BottomNavMoreItem(
                                            icon: Icons
                                                .supervised_user_circle_rounded,
                                            iconName: context.locale
                                                .translate('facilities')!,
                                          ),
                                          BottomNavMoreItem(
                                            icon: Icons.event_available_rounded,
                                            iconName: context.locale
                                                .translate('weeding&events')!,
                                          ),
                                        ],
                                      ),
                                    )
                                  : const SizedBox();
                            },
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(30),
                                  topRight: Radius.circular(30)),
                              color: Colors.transparent.withOpacity(
                                .5,
                              ),
                            ),
                            child: const BottomNavBar(),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
