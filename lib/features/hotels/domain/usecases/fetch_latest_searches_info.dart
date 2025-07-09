import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/search_data.dart';
import '../repositories/hotels_repository.dart';

class FetchLatestSearchesInfo extends UseCase<List<SearchData>, NoParams> {
  final HotelsRepository repository;

  FetchLatestSearchesInfo({required this.repository});

  @override
  Future<Either<Failure, List<SearchData>>> call(NoParams params) {
    return repository.fetchLatestSearchesInfo();
  }
}
