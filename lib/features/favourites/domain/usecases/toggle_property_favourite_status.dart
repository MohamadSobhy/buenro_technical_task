import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../../../hotels/domain/entities/property.dart';
import '../repositories/favourites_repository.dart';

class TogglePropertyFavouriteStatus
    extends UseCase<List<Property>, ToggleFavouriteParams> {
  final FavouritesRepository repository;

  TogglePropertyFavouriteStatus({required this.repository});

  @override
  Future<Either<Failure, List<Property>>> call(ToggleFavouriteParams params) {
    return repository.togglePropertyFavouriteStatus(
      property: params.property,
      isFavourite: params.isFavourite,
    );
  }
}

class ToggleFavouriteParams extends Equatable {
  final Property property;
  final bool isFavourite;

  const ToggleFavouriteParams({
    required this.property,
    required this.isFavourite,
  });

  @override
  List<Object?> get props => [property, isFavourite];
}
