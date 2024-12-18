import 'package:animate_do/animate_do.dart';
import 'package:elite_beach/core/utils/helper.dart';
import 'package:elite_beach/features/home/presentation/widgets/social_media_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/locale/app_localizations.dart';
import '../../../../../core/utils/assets.dart';
import '../../../../splash/presentation/manger/locale_cubit/locale_cubit.dart';
import '../../widgets/home_navigation_item.dart';

// ignore: must_be_immutable
class HomeScreenWebView extends StatelessWidget {
  HomeScreenWebView({super.key});
  late AppLocalizations locale;
  @override
  Widget build(BuildContext context) {
    locale = AppLocalizations.of(context)!;

    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Image.asset(
              AssetsData.homeImage,
              fit: BoxFit.cover,
              height: context.screenHeight,
              width: context.screenWidth,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: context.screenWidth * .01,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  FadeInDown(
                    duration: const Duration(seconds: 2),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        //logo
                        Image.asset(
                          AssetsData.eliteLogoNoBg,
                          width: context.screenHeight * .07,
                          height: context.screenWidth * .07,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: context.screenWidth * .03,
                        ),
                        //Tabs
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          // mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              // mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                HomeNavigationItem(
                                  itemName: context.locale.translate('home')!,
                                  tapHandler: () {},
                                ),
                                SizedBox(
                                  width: context.screenWidth * .03,
                                ),
                                HomeNavigationItem(
                                  itemName: context.locale.translate('about')!,
                                  tapHandler: () {},
                                ),
                                SizedBox(
                                  width: context.screenWidth * .03,
                                ),
                                HomeNavigationItem(
                                  itemName:
                                      context.locale.translate('gallery')!,
                                  tapHandler: () {},
                                ),
                                SizedBox(
                                  width: context.screenWidth * .03,
                                ),
                                HomeNavigationItem(
                                  itemName: context.locale.translate('units')!,
                                  tapHandler: () {},
                                ),
                                SizedBox(
                                  width: context.screenWidth * .03,
                                ),
                                HomeNavigationItem(
                                  itemName: context.locale.translate('offers')!,
                                  tapHandler: () {},
                                ),
                                SizedBox(
                                  width: context.screenWidth * .03,
                                ),
                                HomeNavigationItem(
                                  itemName:
                                      context.locale.translate('rest&bar')!,
                                  tapHandler: () {},
                                ),
                                SizedBox(
                                  width: context.screenWidth * .03,
                                ),
                                HomeNavigationItem(
                                  itemName:
                                      context.locale.translate('facilities')!,
                                  tapHandler: () {},
                                ),
                                SizedBox(
                                  width: context.screenWidth * .03,
                                ),
                                HomeNavigationItem(
                                  itemName: context.locale
                                      .translate('weeding&events')!,
                                  tapHandler: () {},
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            //    const Divider(),
                            // Container(
                            //   height: 3,
                            //   width: context.screenWidth - 190,
                            //   decoration: BoxDecoration(
                            //     color: Colors.white,
                            //     borderRadius: BorderRadius.circular(20),
                            //   ),
                            // ),
                          ],
                        ),
                        const Spacer(),
                        InkWell(
                          onTap: () {
                            locale.isEnLocale
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
                                    locale.isEnLocale ? 'ع' : 'En',
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
                        ),
                      ],
                    ),
                  ),
                  const Divider(),

                  SizedBox(
                    height: context.screenHeight * .15,
                  ),

                  //body
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: context.screenWidth * .01,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: FadeInLeft(
                            duration: const Duration(seconds: 5),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SocialMediaItem(
                                    imagePath: AssetsData.whatsApp,
                                    tapHandler: () {}),
                                const SizedBox(
                                  height: 15,
                                ),
                                SocialMediaItem(
                                    imagePath: AssetsData.instagram,
                                    tapHandler: () {}),
                                const SizedBox(
                                  height: 15,
                                ),
                                SocialMediaItem(
                                    imagePath: AssetsData.facebook,
                                    tapHandler: () {}),
                                const SizedBox(
                                  height: 15,
                                ),
                                SocialMediaItem(
                                    imagePath: AssetsData.call,
                                    tapHandler: () {}),
                                const SizedBox(
                                  height: 25,
                                ),
                                Container(
                                  margin:
                                      const EdgeInsets.symmetric(horizontal: 8),
                                  height: 100,
                                  width: 5,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.orange,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 10,
                          child: FadeIn(
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
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
