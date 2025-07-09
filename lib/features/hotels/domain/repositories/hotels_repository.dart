import 'package:buenro_technical_task/features/hotels/domain/entities/search_data.dart';

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

  AppResult<List<SearchData>> fetchLatestSearchesInfo();
}
