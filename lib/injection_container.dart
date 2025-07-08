import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'core/errors/repository_call_handler.dart';
import 'core/localization/localization_controller.dart';
import 'core/network/network_info.dart';

final servLocator = GetIt.instance;

Future<void> initServiceLocator() async {
  //! Core
  servLocator.registerLazySingleton(() => Hive);
  servLocator.registerLazySingleton<NetworkInfo>(() => AppNetworkInfo());
  servLocator.registerLazySingleton(
    () => RepositoryCallHandler(networkInfo: servLocator()),
  );

  //! Features

  //* Localization Feature
  servLocator.registerLazySingleton(() => LocalizationController());
}
