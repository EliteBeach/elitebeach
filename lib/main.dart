import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'core/utils/functions/setup_service_locator.dart' as di;
import 'core/utils/simple_bloc_observer.dart';
import 'features/home/presentation/screens/home_screen.dart';

void main() async {
  // Ensure Flutter engine is initialized
  // SystemChrome.setPreferredOrientations(
  //     [DeviceOrientation.portraitUp] // Disable upside down
  //     );
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: 'https://wxpjadqnivgsgxnbxdeo.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Ind4cGphZHFuaXZnc2d4bmJ4ZGVvIiwicm9sZSI6ImFub24iLCJpYXQiOjE3Mzk0NTIyMDYsImV4cCI6MjA1NTAyODIwNn0.1gvdZhxoN828qSM7rtX8Uj-n57T4K1Ntgbx0L2QamsE',
  );
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
