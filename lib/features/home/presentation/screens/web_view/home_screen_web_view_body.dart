import 'package:elite_beach/core/utils/helper.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/assets.dart';
import '../../widgets/top_nav_bar_web.dart';

// ignore: must_be_immutable
class HomeScreenWebViewBody extends StatelessWidget {
  const HomeScreenWebViewBody(
      {super.key, required this.imgPath, required this.screenBody});
  final String imgPath;
  final Widget screenBody;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Stack(
        children: [
          imgPath == ''
              ? const SizedBox()
              : Image.asset(
                  imgPath,
                  fit: BoxFit.cover,
                  height: context.screenHeight,
                  width: context.screenWidth,
                ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: context.screenWidth * .03,
            ),
            child: Image.asset(
              AssetsData.eliteLogoNoBg,
              width: context.screenHeight * .15,
              height: context.screenWidth * .15,
              color: Colors.white,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: context.screenWidth * .01,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // WEB view NaV BAR
                const TopNavBarWeb(),
                SizedBox(
                  height: context.screenHeight * .2,
                ),

                //body
                screenBody,
              ],
            ),
          ),
        ],
      ),
    );
  }
}
