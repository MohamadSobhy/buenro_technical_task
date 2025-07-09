part of 'latest_searches_bloc.dart';

abstract class LatestSearchesEvent extends Equatable {
  const LatestSearchesEvent();

  @override
  List<Object?> get props => [];
}

class FetchedLatestSearchesEvent extends LatestSearchesEvent {}
