import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'core/errors/repository_call_handler.dart';
import 'core/localization/localization_controller.dart';
import 'core/network/network_info.dart';
import 'features/hotels/data/datasources/hotels_local_data_source.dart';
import 'features/hotels/data/datasources/hotels_remote_data_source.dart';
import 'features/hotels/data/repositories/app_hotels_repositories.dart';
import 'features/hotels/domain/repositories/hotels_repository.dart';
import 'features/hotels/domain/usecases/fetch_latest_searches_info.dart';
import 'features/hotels/domain/usecases/search_for_hotels.dart';
import 'features/hotels/presentation/blocs/hotels_bloc/hotels_bloc.dart';
import 'features/hotels/presentation/blocs/latest_searches_bloc/latest_searches_bloc.dart';

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

  //* Hotels Feature

  //? Hotels Bloc & Controllers
  servLocator.registerLazySingleton(
    () => HotelsBloc(searchForHotels: servLocator()),
  );
  servLocator.registerLazySingleton(
    () => LatestSearchesBloc(fetchLatestSearchesInfo: servLocator()),
  );

  //? Hotels Usecases
  servLocator.registerLazySingleton(
    () => SearchForHotels(repository: servLocator()),
  );
  servLocator.registerLazySingleton(
    () => FetchLatestSearchesInfo(repository: servLocator()),
  );

  //? Hotels Repositories
  servLocator.registerLazySingleton<HotelsRepository>(
    () => AppHotelsRepositories(
      callHandler: servLocator(),
      remoteDataSource: servLocator(),
      localDataSource: servLocator(),
    ),
  );

  //? Hotels Data Sources
  servLocator.registerLazySingleton<HotelsRemoteDataSource>(
    () => AppHotelsRemoteDataSource(),
  );
  servLocator.registerLazySingleton<HotelsLocalDataSource>(
    () => AppHotelsLocalDataSource(hive: servLocator()),
  );
}
