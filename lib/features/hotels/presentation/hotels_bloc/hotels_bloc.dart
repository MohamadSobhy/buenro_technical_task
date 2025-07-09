import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/properties_response.dart';
import '../../domain/entities/property.dart';
import '../../domain/usecases/search_for_hotels.dart';

part 'hotels_event.dart';
part 'hotels_state.dart';

class HotelsBloc extends Bloc<HotelsEvent, HotelsState> {
  final SearchForHotels searchForHotels;

  HotelsBloc({required this.searchForHotels}) : super(HotelsInitialState()) {
    on<HotelsEvent>(_mapEventsIntoStates);
  }

  final List<Property> _properties = [];

  FutureOr<void> _mapEventsIntoStates(
    HotelsEvent event,
    Emitter<HotelsState> emit,
  ) async {
    if (event is SearchForHotelsEvent) {
      await _handleSearchForHotelsEvent(event, emit);
    }
  }

  Future<void> _handleSearchForHotelsEvent(
    SearchForHotelsEvent event,
    Emitter<HotelsState> emit,
  ) async {
    if (event.nextPageToken != null) {
      emit(HotelsNextPageLoadingState());
    } else {
      emit(HotelsLoadingState());
    }

    final result = await searchForHotels(
      SearchHotelsParams(
        query: event.query,
        checkInDate: event.checkInDate,
        checkOutDate: event.checkOutDate,
        nextPageToken: event.nextPageToken,
        numberOfAdults: event.numberOfAdults,
      ),
    );

    emit(
      result.fold(
        (failure) {
          if (event.nextPageToken != null) {
            return HotelsNextPageErrorState(message: failure.message);
          }

          return HotelsErrorState(message: failure.message);
        },
        (response) {
          if (event.nextPageToken == null) _properties.clear();

          _properties.addAll(response.properties);

          return HotelsFetchedState(
            response: response.copyWith(
              properties: _properties.toSet().toList(),
            ),
          );
        },
      ),
    );
  }
}
