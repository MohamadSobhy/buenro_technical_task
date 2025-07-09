part of 'latest_searches_bloc.dart';

abstract class LatestSearchesState extends Equatable {
  const LatestSearchesState();

  @override
  List<Object?> get props => [];
}

class LatestSearchesInitialState extends LatestSearchesState {}

class LatestSearchesLoadingState extends LatestSearchesState {}

class LatestSearchesErrorState extends LatestSearchesState {
  final String message;

  const LatestSearchesErrorState({required this.message});

  @override
  List<Object?> get props => [message];
}

class LatestSearchesFetchedState extends LatestSearchesState {
  final List<SearchData> searches;

  const LatestSearchesFetchedState({required this.searches});

  @override
  List<Object?> get props => [searches];
}
