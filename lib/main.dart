import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import 'core/utils/functions/setup_service_locator.dart' as di;
import 'core/utils/simple_bloc_observer.dart';
import 'features/home/presentation/screens/home_screen.dart';

void main() async {
  // Ensure Flutter engine is initialized
  // SystemChrome.setPreferredOrientations(
  //     [DeviceOrientation.portraitUp] // Disable upside down
  //     );

  Bloc.observer = SimpleBlocObserver();
  await di.init();
  // await Hive.initFlutter();

  // Hive.registerAdapter(LoginEntityAdapter());
  // Hive.registerAdapter(RefreshUserDataEntityAdapter());

  // await Hive.openBox<LoginEntity>(kUserDataBox);
  // await Hive.openBox<RefreshUserDataEntity>(kRefreshUserDataBox);
  // await Hive.openBox<String>(kNewTokenBox);
  runApp(const HomeScreen());
}
