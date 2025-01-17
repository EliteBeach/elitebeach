import 'package:elite_beach/core/utils/helper.dart';
import 'package:elite_beach/features/home/presentation/screens/mobile_view/home_screen_mobile_view.dart';
import 'package:elite_beach/features/home/presentation/screens/web_view/home_screen_web_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/locale/app_localizations_setup.dart';
import '../../../../core/utils/functions/setup_service_locator.dart';
import '../../../../core/utils/routes/app_routes.dart';
import '../../../splash/presentation/manger/locale_cubit/locale_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var shortestSide = MediaQuery.of(context).size.shortestSide;

// Determine if we should use mobile layout or not, 600 here is
// a common breakpoint for a typical 7-inch tablet.
    final bool useMobileLayout = shortestSide < 600;
    final bool useWeb = context.screenWidth < 850;
    return BlocProvider(
      create: (context) => getIt<LocaleCubit>()..getSavedLang(),
      child: BlocBuilder<LocaleCubit, LocaleState>(
        buildWhen: (previousState, currentState) =>
            previousState != currentState,
        builder: (_, localeState) {
          return MaterialApp(
            theme: ThemeData(fontFamily: 'EduAUVICWANTPre'),
            locale: localeState.locale,
            onGenerateRoute: AppRoutes.onGenerateRoute,
            supportedLocales: AppLocalizationsSetup.supportedLocales,
            localeResolutionCallback:
                AppLocalizationsSetup.localeResolutionCallback,
            localizationsDelegates:
                AppLocalizationsSetup.localizationsDelegates,
            title: 'Elite Beach',
            debugShowCheckedModeBanner: false,
            home: useWeb
                ? const HomeScreenMobileView()
                : const HomeScreenWebView(),
          );
        },
      ),
    );
  }
}
