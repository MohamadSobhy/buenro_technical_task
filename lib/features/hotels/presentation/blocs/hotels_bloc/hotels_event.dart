part of 'hotels_bloc.dart';

abstract class HotelsEvent extends Equatable {
  const HotelsEvent();
}

class SearchForHotelsEvent extends HotelsEvent {
  final String query;
  final String checkInDate;
  final String checkOutDate;
  final String? nextPageToken;
  final int numberOfAdults;

  const SearchForHotelsEvent({
    required this.query,
    required this.checkInDate,
    required this.checkOutDate,
    this.nextPageToken,
    this.numberOfAdults = 1,
  });

  @override
  List<Object?> get props => [
    query,
    checkInDate,
    checkOutDate,
    nextPageToken,
    numberOfAdults,
  ];
}
