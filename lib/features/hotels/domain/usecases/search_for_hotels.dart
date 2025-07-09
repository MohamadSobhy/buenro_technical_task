import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/properties_response.dart';
import '../repositories/hotels_repository.dart';

class SearchForHotels extends UseCase<PropertiesResponse, SearchHotelsParams> {
  final HotelsRepository repository;

  SearchForHotels({required this.repository});

  @override
  Future<Either<Failure, PropertiesResponse>> call(SearchHotelsParams params) {
    return repository.searchForHotels(
      query: params.query,
      checkInDate: params.checkInDate,
      checkOutDate: params.checkOutDate,
      nextPageToken: params.nextPageToken,
      numberOfAdults: params.numberOfAdults,
    );
  }
}

class SearchHotelsParams {
  final String query;
  final String checkInDate;
  final String checkOutDate;
  final String? nextPageToken;
  final int numberOfAdults;

  SearchHotelsParams({
    required this.query,
    required this.checkInDate,
    required this.checkOutDate,
    this.nextPageToken,
    this.numberOfAdults = 1,
  });
}
