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
      // case kEliteLoginScreenRoute:
      //   return MaterialPageRoute(builder: (_) => const LoginScreen());

      default:
        return null;
    }
  }
}
