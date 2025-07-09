import 'dart:async';

import 'package:buenro_technical_task/core/usecase/usecase.dart';
import 'package:buenro_technical_task/features/favourites/domain/usecases/fetch_favourite_properties.dart';
import 'package:buenro_technical_task/features/favourites/domain/usecases/toggle_property_favourite_status.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../hotels/domain/entities/property.dart';

part 'favourites_event.dart';
part 'favourites_state.dart';

class FavouritesBloc extends Bloc<FavouritesEvent, FavouritesState> {
  final FetchFavouriteProperties fetchFavouriteProperties;
  final TogglePropertyFavouriteStatus togglePropertyFavouriteStatus;

  FavouritesBloc({
    required this.fetchFavouriteProperties,
    required this.togglePropertyFavouriteStatus,
  }) : super(FavouritesInitialState()) {
    on<FavouritesEvent>(_mapEventsIntoStatus);
  }

  List<Property> _favouriteProperties = [];

  FutureOr<void> _mapEventsIntoStatus(event, emit) async {
    if (event is FetchFavouritePropertiesEvent) {
      await _handleFetchFavouritePropertiesEvent(event, emit);
    } else if (event is TogglePropertyFavouriteStatusEvent) {
      await _handleTogglePropertyFavouriteStatusEvent(event, emit);
    }
  }

  Future<void> _handleFetchFavouritePropertiesEvent(
    FetchFavouritePropertiesEvent event,
    emit,
  ) async {
    emit(FavouritesLoadingState());

    final result = await fetchFavouriteProperties(NoParams());

    emit(
      result.fold(
        (failure) => FavouritesErrorState(message: failure.message),
        (properties) => FavouritePropertiesFetchedState(
          properties: _favouriteProperties = properties,
        ),
      ),
    );
  }

  Future<void> _handleTogglePropertyFavouriteStatusEvent(
    TogglePropertyFavouriteStatusEvent event,
    emit,
  ) async {
    emit(
      ToggleFavouriteLoadingState(propertyToken: event.property.propertyToken),
    );

    final result = await togglePropertyFavouriteStatus(
      ToggleFavouriteParams(
        property: event.property,
        isFavourite: event.isFavourite,
      ),
    );

    emit(
      result.fold(
        (failure) => ToggleFavouriteErrorState(
          message: failure.message,
          propertyToken: event.property.propertyToken,
        ),
        (properties) {
          emit(
            FavouritePropertiesFetchedState(
              properties: _favouriteProperties = properties,
            ),
          );

          return FavouriteStatusToggledState(
            isFavourite: event.isFavourite,
            propertyToken: event.property.propertyToken,
          );
        },
      ),
    );
  }

  bool isFavouriteProperty(String token) {
    final index = _favouriteProperties.indexWhere(
      (e) => e.propertyToken == token,
    );

    return index != -1;
  }
}
