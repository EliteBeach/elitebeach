import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../features/home/presentation/manager/cubit/bottom_nav_cubit_cubit.dart';
import '../../../features/splash/data/datasources/language_local_data_source.dart';
import '../../../features/splash/data/datasources/language_local_data_source_impl.dart';
import '../../../features/splash/data/repositories/language_repository_impl.dart';
import '../../../features/splash/domain/repositories/language_repository.dart';
import '../../../features/splash/domain/usecases/change_locale_use_case.dart';
import '../../../features/splash/domain/usecases/get_saved_lang_use_case.dart';
import '../../../features/splash/presentation/manger/locale_cubit/locale_cubit.dart';
import '../api_service.dart';
import '../network/network_request.dart';

final getIt = GetIt.instance;
Future<void> init() async {
  getIt.registerSingleton<ApiService>(
    ApiService(
      Dio(),
    ),
  );

  getIt.registerFactory<LocaleCubit>(() => LocaleCubit(
        changeLocaleUseCase: getIt.call(),
        getSavedLangUseCase: getIt.call(),
      ));

  getIt.registerLazySingleton<GetSavedLangUseCase>(
      () => GetSavedLangUseCase(languageRepository: getIt.call()));
  getIt.registerLazySingleton<ChangeLocaleUseCase>(
      () => ChangeLocaleUseCase(languageRepository: getIt.call()));

  getIt.registerLazySingleton<LanguageRepository>(
      () => LanguageRepositoryImpl(languageLocalDataSource: getIt.call()));

  getIt.registerLazySingleton<LanguageLocalDataSource>(
    () => LanguageLocalDataSourceImpl(sharedPreferences: getIt()),
  );

  //cubits
  getIt.registerFactory<BottomNavCubit>(() => BottomNavCubit());
  //CancelInvitation
  // getIt.registerFactory<CancelInvitationCubit>(
  //     () => CancelInvitationCubit(getIt.call()));
  // getIt.registerLazySingleton<CancelInvitationUseCase>(
  //     () => CancelInvitationUseCase(getIt.call()));
  // getIt.registerLazySingleton<CancelInvitationRepo>(
  //     () => CancelInvitationRepoImpl(getIt.call()));
  // getIt.registerLazySingleton<CancelInvitationRemoteDataSource>(
  //     () => CancelInvitationRemoteDataSourceImpl());
//Network
  getIt.registerLazySingleton<NetworkRequest>(() => NetworkRequestImp());

  //! External
  final sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerLazySingleton(() => sharedPreferences);
}
