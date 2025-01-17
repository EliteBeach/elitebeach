import 'package:elite_beach/features/about/presentation/screens/mobile/about_mobile_screen.dart';
import 'package:elite_beach/features/gallery/presentation/screens/mobile/gallery_screen_mobile.dart';
import 'package:elite_beach/features/home/presentation/manager/cubit/bottom_nav_cubit_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/functions/setup_service_locator.dart';
import 'home_screen_mobile_body.dart';

class HomeScreenMobileView extends StatelessWidget {
  const HomeScreenMobileView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<BottomNavCubit>(),
      child: BlocBuilder<BottomNavCubit, BottomNavCubitState>(
        builder: (context, state) {
          int activeIndex =
              BlocProvider.of<BottomNavCubit>(context).activeBottomNavIndex;
          return Scaffold(
            body: BlocBuilder<BottomNavCubit, BottomNavCubitState>(
              builder: (context, state) {
                return activeIndex == 0
                    ? const HomeScreenMobileBody()
                    : activeIndex == 1
                        ? const AboutMobileScreen()
                        : activeIndex == 2
                            ? const GalleryScreenMobile()
                            : const HomeScreenMobileBody();
              },
            ),
          );
        },
      ),
    );
  }
}
