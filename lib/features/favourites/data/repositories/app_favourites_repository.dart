import '../../../../core/api/typedefs.dart';
import '../../../../core/errors/repository_call_handler.dart';
import '../../../hotels/data/models/property_model.dart';
import '../../../hotels/domain/entities/property.dart';
import '../../domain/repositories/favourites_repository.dart';
import '../datasources/favourites_local_data_source.dart';

class AppFavouritesRepository extends FavouritesRepository {
  final RepositoryCallHandler callHandler;
  final FavouritesLocalDataSource localDataSource;

  AppFavouritesRepository({
    required this.callHandler,
    required this.localDataSource,
  });

  @override
  AppResult<List<Property>> fetchFavouriteProperties() {
    return callHandler.handleCall(
      () => localDataSource.fetchFavouriteProperties(),
    );
  }

  @override
  AppResult<List<Property>> togglePropertyFavouriteStatus({
    required Property property,
    required bool isFavourite,
  }) {
    return callHandler.handleCall(
      () => localDataSource.togglePropertyFavouriteStatus(
        property: property as PropertyModel,
        isFavourite: isFavourite,
      ),
    );
  }
}
