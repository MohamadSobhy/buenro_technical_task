import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../../../hotels/domain/entities/property.dart';
import '../repositories/favourites_repository.dart';

class FetchFavouriteProperties extends UseCase<List<Property>, NoParams> {
  final FavouritesRepository repository;

  FetchFavouriteProperties({required this.repository});

  @override
  Future<Either<Failure, List<Property>>> call(NoParams params) {
    return repository.fetchFavouriteProperties();
  }
}
