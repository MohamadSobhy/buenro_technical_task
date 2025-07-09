import '../../../../core/api/typedefs.dart';
import '../../../hotels/domain/entities/property.dart';

abstract class FavouritesRepository {
  AppResult<List<Property>> fetchFavouriteProperties();
  AppResult<List<Property>> togglePropertyFavouriteStatus({
    required Property property,
    required bool isFavourite,
  });
}
