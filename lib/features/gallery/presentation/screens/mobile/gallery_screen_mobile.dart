import 'package:animate_do/animate_do.dart';
import 'package:elite_beach/core/utils/gaps.dart';
import 'package:elite_beach/core/utils/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/assets.dart';
import '../../../../home/presentation/screens/mobile_view/bottom_nav_bar.dart';
import '../../../../splash/presentation/manger/locale_cubit/locale_cubit.dart';

class GalleryScreenMobile extends StatelessWidget {
  const GalleryScreenMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          // decoration: const BoxDecoration(
          //   gradient: LinearGradient(tileMode: TileMode.mirror, colors: [
          //     Colors.teal,
          //     Colors.blueAccent,
          //     Colors.cyan,
          //     Colors.blue,
          //   ]),
          // ),
          child: Image.asset(
            AssetsData.homeImage,
            opacity: const AlwaysStoppedAnimation(.8),
            fit: BoxFit.cover,
            height: context.screenHeight,
            width: context.screenWidth,
          ),
        ),
        Padding(
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
                      color: Colors.white,
                    ),
                    const Spacer(),
                    Text(
                      'Elite Gallery',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
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
              SizedBox(
                height: context.screenHeight * .7,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
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
                                AssetsData.pool,
                              ),
                            );
                          },
                        ),
                      ),
                      Gaps.vGap16,
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
                                AssetsData.pool,
                              ),
                            );
                          },
                        ),
                      ),
                      Gaps.vGap16,
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
                                AssetsData.pool,
                              ),
                            );
                          },
                        ),
                      ),
                      Gaps.vGap16,
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
                                AssetsData.pool,
                              ),
                            );
                          },
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
        ),
      ],
    );
  }
}
