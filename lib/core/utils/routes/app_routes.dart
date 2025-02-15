import 'package:elite_beach/features/gallery/presentation/screens/mobile/gallery_details_mobile_screen.dart';
import 'package:elite_beach/features/home/presentation/screens/mobile_view/book_now_screen.dart';
import 'package:flutter/material.dart';

import '../../../features/home/presentation/screens/home_screen.dart';
import '../../../features/housing/data/models/housing_units.dart';
import '../../../features/housing/presentation/views/mobile/housing_details_screen.dart';
import '../constants.dart';

class AppRoutes {
  static Route? onGenerateRoute(RouteSettings routeSettings) {
    // ignore: unused_local_variable
    final args = routeSettings.arguments;

    switch (routeSettings.name) {
      case initialRoute:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case kGalleryDetailsMobileScreenRoute:
        String args = routeSettings.arguments as String;
        return MaterialPageRoute(
          builder: (_) => GalleryDetailsMobileScreen(
            galleryTitle: args,
          ),
        );
      case kHousingDetailsMobileScreenRoute:
        HousingUnitModel args = routeSettings.arguments as HousingUnitModel;
        return MaterialPageRoute(
            builder: (_) => HousingDetailsScreenMobile(
                  housingUnitModel: args,
                ));
      case kBookingScreen:
        return MaterialPageRoute(
            builder: (_) => const CustomReservationScreen());
      default:
        return null;
    }
  }
}
