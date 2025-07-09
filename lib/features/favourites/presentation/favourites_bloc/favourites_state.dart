part of 'favourites_bloc.dart';

abstract class FavouritesState extends Equatable {
  final String propertyToken;

  const FavouritesState({this.propertyToken = ''});

  @override
  List<Object?> get props => [propertyToken];
}

class FavouritesInitialState extends FavouritesState {}

/// Fetch Favourites List States
class FavouritesLoadingState extends FavouritesState {}

class FavouritesErrorState extends FavouritesState {
  final String message;

  const FavouritesErrorState({required this.message});

  @override
  List<Object?> get props => [message];
}

class FavouritePropertiesFetchedState extends FavouritesState {
  final List<Property> properties;

  const FavouritePropertiesFetchedState({required this.properties});

  @override
  List<Object?> get props => [properties];
}

/// Toggle Favourite Status States
class ToggleFavouriteLoadingState extends FavouritesState {
  const ToggleFavouriteLoadingState({required super.propertyToken});

  @override
  List<Object?> get props => [propertyToken];
}

class ToggleFavouriteErrorState extends FavouritesState {
  final String message;
  const ToggleFavouriteErrorState({
    required this.message,
    required super.propertyToken,
  });

  @override
  List<Object?> get props => [message, propertyToken];
}

class FavouriteStatusToggledState extends FavouritesState {
  final bool isFavourite;

  const FavouriteStatusToggledState({
    required this.isFavourite,
    required super.propertyToken,
  });

  @override
  List<Object?> get props => [isFavourite, propertyToken];
}
