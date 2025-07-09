part of 'favourites_bloc.dart';

abstract class FavouritesEvent extends Equatable {
  const FavouritesEvent();

  @override
  List<Object?> get props => [];
}

class FetchFavouritePropertiesEvent extends FavouritesEvent {}

class TogglePropertyFavouriteStatusEvent extends FavouritesEvent {
  final Property property;
  final bool isFavourite;

  const TogglePropertyFavouriteStatusEvent({
    required this.property,
    required this.isFavourite,
  });

  @override
  List<Object?> get props => [property, isFavourite];
}
