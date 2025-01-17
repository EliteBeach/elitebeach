import 'package:elite_beach/core/utils/assets.dart';
import 'package:elite_beach/core/utils/helper.dart';
import 'package:elite_beach/features/home/presentation/screens/mobile_view/bottom_nav_bar.dart';
import 'package:flutter/material.dart';

class AboutMobileScreen extends StatelessWidget {
  const AboutMobileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          AssetsData.aboutScreenImg,
          fit: BoxFit.cover,
          height: context.screenHeight,
          width: context.screenWidth,
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: context.screenWidth * .05,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Image.asset(
                    AssetsData.eliteLogoNoBg,
                    width: context.screenWidth * .15,
                    height: context.screenHeight * .15,
                    color: Colors.white,
                  ),
                ],
              ),
              SizedBox(
                height: context.screenHeight * .1,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Icon(
                        Icons.maps_home_work_rounded,
                        color: Colors.blueGrey,
                      ),
                      SizedBox(
                        width: context.screenWidth * .03,
                      ),
                      Text(
                        context.locale.translate('about_txt_1')!,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: context.screenHeight * .03,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Icon(
                        Icons.location_on_rounded,
                        color: Colors.blueGrey,
                      ),
                      SizedBox(
                        width: context.screenWidth * .03,
                      ),
                      Text(
                        context.locale.translate('about_txt_2')!,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: context.screenHeight * .03,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Icon(
                        Icons.flag_circle_rounded,
                        color: Colors.blueGrey,
                      ),
                      SizedBox(
                        width: context.screenWidth * .03,
                      ),
                      Text(
                        context.locale.translate('about_txt_3')!,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
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
