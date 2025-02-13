import 'package:elite_beach/features/gallery/presentation/screens/mobile/gallery_screen_mobile.dart';
import 'package:elite_beach/features/home/presentation/manager/cubit/bottom_nav_cubit_cubit.dart';
import 'package:elite_beach/features/housing/presentation/views/mobile/housing_screen_mobile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/functions/setup_service_locator.dart';
import '../../../../facilities/presentation/screens/mobile/facilities_mobile_screen.dart';
import '../../../../more/presentation/screens/more_screen_mobile.dart';
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
            backgroundColor:
                activeIndex != 0 ? const Color(0xffB0BDC0) : Colors.white,
            body: BlocBuilder<BottomNavCubit, BottomNavCubitState>(
              builder: (context, state) {
                return activeIndex == 0
                    ? const HomeScreenMobileBody()
                    : activeIndex == 1
                        ? const GalleryScreenMobile()
                        : activeIndex == 2
                            ? const HousingScreenMobile()
                            : activeIndex == 3
                                ? const FacilitiesMobileScreen()
                                : const MoreScreenMobile();
              },
            ),
          );
        },
      ),
    );
  }
}
