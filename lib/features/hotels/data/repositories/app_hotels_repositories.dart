import '../../../../core/api/typedefs.dart';
import '../../../../core/errors/repository_call_handler.dart';
import '../../domain/entities/properties_response.dart';
import '../../domain/entities/search_data.dart';
import '../../domain/repositories/hotels_repository.dart';
import '../datasources/hotels_local_data_source.dart';
import '../datasources/hotels_remote_data_source.dart';
import '../models/search_data_model.dart';

class AppHotelsRepository extends HotelsRepository {
  final RepositoryCallHandler callHandler;
  final HotelsRemoteDataSource remoteDataSource;
  final HotelsLocalDataSource localDataSource;

  AppHotelsRepository({
    required this.callHandler,
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  AppResult<PropertiesResponse> searchForHotels({
    required String query,
    required String checkInDate,
    required String checkOutDate,
    required String? nextPageToken,
    int numberOfAdults = 1,
  }) {
    return callHandler.handleCall(() {
      localDataSource.saveSearchInfo(
        SearchDataModel(
          query: query,
          checkInDate: checkInDate,
          checkOutDate: checkOutDate,
          numberOfAdults: numberOfAdults,
        ),
      );

      return remoteDataSource.searchForHotels(
        query: query,
        checkInDate: checkInDate,
        checkOutDate: checkOutDate,
        nextPageToken: nextPageToken,
        numberOfAdults: numberOfAdults,
      );
    });
  }

  @override
  AppResult<List<SearchData>> fetchLatestSearchesInfo() {
    return callHandler.handleCall(
      () => localDataSource.fetchLatestSearchInfo(),
    );
  }
}
