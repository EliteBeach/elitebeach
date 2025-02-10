import 'package:animate_do/animate_do.dart';
import 'package:elite_beach/core/utils/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../core/utils/assets.dart';
import '../../../../../core/utils/constants.dart';

class SplashScreenBody extends StatefulWidget {
  const SplashScreenBody({super.key});

  @override
  State<SplashScreenBody> createState() => _SplashScreenBodyState();
}

class _SplashScreenBodyState extends State<SplashScreenBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slidingAnimation;

  @override
  void initState() {
    super.initState();
    initSlidingAnimation();
    Future.delayed(
      const Duration(seconds: 2),
      () {
        checkFirstSeen(context);
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ZoomIn(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.asset(
            AssetsData.eliteLogo,
            width: context.screenWidth * .5,
          ),
        ),
      ),
    );
  }

  void initSlidingAnimation() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    slidingAnimation =
        Tween<Offset>(begin: const Offset(0, 2), end: Offset.zero)
            .animate(animationController);

    animationController.forward();
  }

  Future<void> checkFirstSeen(BuildContext context) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    bool seen = (pref.getBool('seen') ?? false);
    if (seen) {
      Navigator.pushReplacementNamed(context, kLanguageScreenRoute);
    } else {
      await pref.setBool('seen', true);

      // Future.delayed(
      //   const Duration(seconds: 2),
      // );
      Navigator.pushReplacementNamed(context, kLanguageScreenRoute);
    }
  }
}
