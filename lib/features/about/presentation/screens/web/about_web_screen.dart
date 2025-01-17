import 'package:animate_do/animate_do.dart';
import 'package:elite_beach/core/utils/helper.dart';
import 'package:flutter/material.dart';

class AboutWebScreenBody extends StatelessWidget {
  const AboutWebScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return FadeIn(
      duration: const Duration(seconds: 2),
      child: Column(
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
    );
  }
}
