import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/usecase/usecase.dart';
import '../../../domain/entities/search_data.dart';
import '../../../domain/usecases/fetch_latest_searches_info.dart';

part 'latest_searches_event.dart';
part 'latest_searches_state.dart';

class LatestSearchesBloc
    extends Bloc<LatestSearchesEvent, LatestSearchesState> {
  final FetchLatestSearchesInfo fetchLatestSearchesInfo;

  LatestSearchesBloc({required this.fetchLatestSearchesInfo})
    : super(LatestSearchesInitialState()) {
    on<LatestSearchesEvent>(_mapEventsIntoStates);
  }

  FutureOr<void> _mapEventsIntoStates(event, emit) async {
    if (event is FetchedLatestSearchesEvent) {
      await _handleFetchLatestSearchesEvent(event, emit);
    }
  }

  Future<void> _handleFetchLatestSearchesEvent(
    FetchedLatestSearchesEvent event,
    emit,
  ) async {
    emit(LatestSearchesLoadingState());

    final result = await fetchLatestSearchesInfo(NoParams());

    emit(
      result.fold(
        (failure) => LatestSearchesErrorState(message: failure.message),
        (searches) => LatestSearchesFetchedState(searches: searches),
      ),
    );
  }
}
