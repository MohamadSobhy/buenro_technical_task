part of 'hotels_bloc.dart';

abstract class HotelsState extends Equatable {
  const HotelsState();

  @override
  List<Object?> get props => [];
}

class HotelsInitialState extends HotelsState {}

class HotelsLoadingState extends HotelsState {}

class HotelsNextPageLoadingState extends HotelsState {}

class HotelsErrorState extends HotelsState {
  final String message;

  const HotelsErrorState({required this.message});

  @override
  List<Object?> get props => [message];
}

class HotelsNextPageErrorState extends HotelsState {
  final String message;

  const HotelsNextPageErrorState({required this.message});

  @override
  List<Object?> get props => [message];
}

class HotelsFetchedState extends HotelsState {
  final PropertiesResponse response;

  const HotelsFetchedState({required this.response});

  @override
  List<Object?> get props => [response];
}
