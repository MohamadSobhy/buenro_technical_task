import '../../../../core/api/typedefs.dart';
import '../entities/properties_response.dart';

abstract class HotelsRepository {
  AppResult<PropertiesResponse> searchForHotels({
    required String query,
    required String checkInDate,
    required String checkOutDate,
    required String? nextPageToken,
    int numberOfAdults = 1,
  });
}
