import '../../domain/entities/search_data.dart';

class SearchDataModel extends SearchData {
  const SearchDataModel({
    required super.query,
    required super.checkInDate,
    required super.checkOutDate,
    required super.numberOfAdults,
  });

  factory SearchDataModel.fromJson(Map<String, dynamic> parsedJson) {
    return SearchDataModel(
      query: parsedJson['query'],
      checkInDate: parsedJson['checkInDate'],
      checkOutDate: parsedJson['checkOutDate'],
      numberOfAdults: parsedJson['numberOfAdults'],
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'query': query,
      'checkInDate': checkInDate,
      'checkOutDate': checkOutDate,
      'numberOfAdults': numberOfAdults,
    };
  }

  @override
  List<Object?> get props => [query, checkInDate, checkOutDate, numberOfAdults];
}
