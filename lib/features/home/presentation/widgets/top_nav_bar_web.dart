import 'package:animate_do/animate_do.dart';
import 'package:elite_beach/core/utils/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/locale/app_localizations.dart';
import '../../../splash/presentation/manger/locale_cubit/locale_cubit.dart';
import '../manager/cubit/bottom_nav_cubit_cubit.dart';
import 'home_navigation_item.dart';

class TopNavBarWeb extends StatelessWidget {
  const TopNavBarWeb({super.key});

  @override
  Widget build(BuildContext context) {
    late AppLocalizations locale;

    locale = AppLocalizations.of(context)!;

    return FadeInDown(
      duration: const Duration(seconds: 2),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //logo

          SizedBox(
            width: context.screenWidth * .03,
          ),
          //Tabs
          Container(
            margin: EdgeInsets.only(
              top: context.screenHeight * .04,
            ),
            alignment: Alignment.center,
            padding: EdgeInsets.only(
              bottom: context.screenHeight *
                  .015, // Space between underline and text
            ),
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.white,
                  width: 1.0, // Underline thickness
                ),
              ),
            ),
            child: Row(
              // mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                HomeNavigationItem(
                  itemName: context.locale.translate('home')!,
                  tapHandler: () {
                    BlocProvider.of<BottomNavCubit>(context).updateUi(0);
                  },
                ),
                SizedBox(
                  width: context.screenWidth * .03,
                ),
                HomeNavigationItem(
                  itemName: context.locale.translate('about')!,
                  tapHandler: () {
                    BlocProvider.of<BottomNavCubit>(context).updateUi(1);
                  },
                ),
                SizedBox(
                  width: context.screenWidth * .03,
                ),
                HomeNavigationItem(
                  itemName: context.locale.translate('gallery')!,
                  tapHandler: () {
                    BlocProvider.of<BottomNavCubit>(context).updateUi(2);
                  },
                ),
                SizedBox(
                  width: context.screenWidth * .03,
                ),
                HomeNavigationItem(
                  itemName: context.locale.translate('units')!,
                  tapHandler: () {
                    BlocProvider.of<BottomNavCubit>(context).updateUi(3);
                  },
                ),
                SizedBox(
                  width: context.screenWidth * .03,
                ),
                HomeNavigationItem(
                  itemName: context.locale.translate('offers')!,
                  tapHandler: () {
                    BlocProvider.of<BottomNavCubit>(context).updateUi(4);
                  },
                ),
                SizedBox(
                  width: context.screenWidth * .03,
                ),
                HomeNavigationItem(
                  itemName: context.locale.translate('rest&bar')!,
                  tapHandler: () {
                    BlocProvider.of<BottomNavCubit>(context).updateUi(5);
                  },
                ),
                SizedBox(
                  width: context.screenWidth * .03,
                ),
                HomeNavigationItem(
                  itemName: context.locale.translate('facilities')!,
                  tapHandler: () {
                    BlocProvider.of<BottomNavCubit>(context).updateUi(6);
                  },
                ),
                SizedBox(
                  width: context.screenWidth * .03,
                ),
                HomeNavigationItem(
                  itemName: context.locale.translate('weeding&events')!,
                  tapHandler: () {
                    BlocProvider.of<BottomNavCubit>(context).updateUi(7);
                  },
                ),
              ],
            ),
          ),
          //  const Spacer(),
          SizedBox(
            width: context.screenWidth * .03,
          ),
          InkWell(
            onTap: () {
              locale.isEnLocale
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
                  borderRadius: BorderRadius.circular(
                    20,
                  ),
                ),
                child: Column(
                  children: [
                    const Icon(Icons.language_rounded),
                    SizedBox(
                      height: context.screenHeight * .01,
                    ),
                    Text(
                      locale.isEnLocale ? 'ع' : 'En',
                      style: TextStyle(
                        fontSize: 16,
                        letterSpacing: context.locale.isEnLocale
                            ? context.screenWidth * .005
                            : null,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        //    fontFamily: 'EduAUVICWANTPre',
                      ),
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
