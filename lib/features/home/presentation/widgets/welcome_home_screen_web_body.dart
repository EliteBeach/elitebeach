import 'package:animate_do/animate_do.dart';
import 'package:elite_beach/core/utils/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/assets.dart';
import '../../../splash/presentation/manger/locale_cubit/locale_cubit.dart';
import 'social_media_item.dart';

class WelcomeHomeScreenWebBody extends StatelessWidget {
  const WelcomeHomeScreenWebBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                      imagePath: AssetsData.whatsApp, tapHandler: () {}),
                  const SizedBox(
                    height: 15,
                  ),
                  SocialMediaItem(
                      imagePath: AssetsData.instagram, tapHandler: () {}),
                  const SizedBox(
                    height: 15,
                  ),
                  SocialMediaItem(
                      imagePath: AssetsData.facebook, tapHandler: () {}),
                  const SizedBox(
                    height: 15,
                  ),
                  SocialMediaItem(
                      imagePath: AssetsData.call, tapHandler: () {}),
                  const SizedBox(
                    height: 25,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 8),
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
              child: Padding(
                padding: EdgeInsets.only(
                  top: context.screenHeight * .2,
                ),
                child: Column(
                  //  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    BlocBuilder<LocaleCubit, LocaleState>(
                      builder: (context, state) {
                        return Text(
                          context.locale.translate('welcome_txt')!,
                          style: TextStyle(
                            letterSpacing: context.locale.isEnLocale
                                ? context.screenWidth * .005
                                : null,
                            fontSize: context.screenWidth * .02,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            //  fontFamily: 'EduAUVICWANTPre',
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
