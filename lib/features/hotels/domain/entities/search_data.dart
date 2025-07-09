import 'package:equatable/equatable.dart';

abstract class SearchData extends Equatable {
  final String query;
  final String checkInDate;
  final String checkOutDate;
  final int numberOfAdults;

  const SearchData({
    required this.query,
    required this.checkInDate,
    required this.checkOutDate,
    required this.numberOfAdults,
  });

  Map<String, dynamic> toJson();
}
