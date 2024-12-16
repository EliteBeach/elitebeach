import 'package:elite_beach/features/home/presentation/screens/mobile_view/home_screen_mobile_view.dart';
import 'package:elite_beach/features/home/presentation/screens/web_view/home_screen_web_view.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var shortestSide = MediaQuery.of(context).size.shortestSide;

// Determine if we should use mobile layout or not, 600 here is
// a common breakpoint for a typical 7-inch tablet.
    final bool useMobileLayout = shortestSide < 600;
    return MaterialApp(
      title: 'Elite Beach',
      debugShowCheckedModeBanner: false,
      home: useMobileLayout
          ? const HomeScreenMobileView()
          : const HomeScreenWebView(),
    );
  }
}
