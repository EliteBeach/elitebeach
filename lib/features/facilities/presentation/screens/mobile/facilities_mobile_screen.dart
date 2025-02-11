import 'package:animate_do/animate_do.dart';
import 'package:elite_beach/core/utils/assets.dart';
import 'package:elite_beach/core/utils/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../home/presentation/screens/mobile_view/bottom_nav_bar.dart';
import '../../../../splash/presentation/manger/locale_cubit/locale_cubit.dart';

class FacilitiesMobileScreen extends StatelessWidget {
  const FacilitiesMobileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Uri url = Uri.parse('https://flutter.dev');
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
          IconButton(
            onPressed: () async {
              await launchUrl(url,
                  mode: LaunchMode.externalNonBrowserApplication);
            },
            icon: const Icon(
              Icons.import_contacts,
            ),
          ),
          const Spacer(),
          const BottomNavBar(),
        ],
      ),
    );
  }
}
