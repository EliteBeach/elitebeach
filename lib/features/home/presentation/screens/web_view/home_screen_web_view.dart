import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/assets.dart';
import '../../../../../core/utils/functions/setup_service_locator.dart';
import '../../manager/cubit/bottom_nav_cubit_cubit.dart';
import '../../widgets/welcome_home_screen_web_body.dart';
import 'home_screen_web_view_body.dart';

// ignore: must_be_immutable
class HomeScreenWebView extends StatelessWidget {
  const HomeScreenWebView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => getIt<BottomNavCubit>(),
        child: BlocBuilder<BottomNavCubit, BottomNavCubitState>(
          builder: (context, state) {
            int activeScreenIndex =
                BlocProvider.of<BottomNavCubit>(context).activeBottomNavIndex;
            return HomeScreenWebViewBody(
              imgPath:
                  (state is BottomNavCubitInitial || activeScreenIndex == 0)
                      ? AssetsData.homeImage
                      : AssetsData.aboutScreenImg,
              screenBody:
                  (state is BottomNavCubitInitial || activeScreenIndex == 0)
                      ? const WelcomeHomeScreenWebBody()
                      : activeScreenIndex == 1
                          ? const WelcomeHomeScreenWebBody()
                          : Text(activeScreenIndex.toString()),
            );
          },
        ),
      ),
    );
  }
}
