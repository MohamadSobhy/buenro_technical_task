import '../../../../core/api/typedefs.dart';
import '../../../../core/errors/repository_call_handler.dart';
import '../../domain/entities/properties_response.dart';
import '../../domain/repositories/hotels_repository.dart';
import '../datasources/hotels_remote_data_source.dart';

class AppHotelsRepositories extends HotelsRepository {
  final RepositoryCallHandler callHandler;
  final HotelsRemoteDataSource remoteDataSource;

  AppHotelsRepositories({
    required this.callHandler,
    required this.remoteDataSource,
  });

  @override
  AppResult<PropertiesResponse> searchForHotels({
    required String query,
    required String checkInDate,
    required String checkOutDate,
    required String? nextPageToken,
    int numberOfAdults = 1,
  }) {
    return callHandler.handleCall(
      () => remoteDataSource.searchForHotels(
        query: query,
        checkInDate: checkInDate,
        checkOutDate: checkOutDate,
        nextPageToken: nextPageToken,
        numberOfAdults: numberOfAdults,
      ),
    );
  }
}
