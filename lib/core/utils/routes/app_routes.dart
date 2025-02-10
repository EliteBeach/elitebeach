import 'package:elite_beach/features/gallery/presentation/screens/mobile/gallery_details_mobile_screen.dart';
import 'package:flutter/material.dart';

import '../../../features/home/presentation/screens/home_screen.dart';
import '../constants.dart';

class AppRoutes {
  static Route? onGenerateRoute(RouteSettings routeSettings) {
    // ignore: unused_local_variable
    final args = routeSettings.arguments;

    switch (routeSettings.name) {
      case initialRoute:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case kGalleryDetailsMobileScreenRoute:
        List<String> args = routeSettings.arguments as List<String>;

        return MaterialPageRoute(
          builder: (_) => GalleryDetailsMobileScreen(
            imagesListPath: args,
          ),
        );

      default:
        return null;
    }
  }
}
