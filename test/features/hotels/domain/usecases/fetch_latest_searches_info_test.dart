import 'dart:convert';

import 'package:buenro_technical_task/core/errors/failures.dart';
import 'package:buenro_technical_task/core/usecase/usecase.dart';
import 'package:buenro_technical_task/features/hotels/data/models/search_data_model.dart';
import 'package:buenro_technical_task/features/hotels/domain/repositories/hotels_repository.dart';
import 'package:buenro_technical_task/features/hotels/domain/usecases/fetch_latest_searches_info.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../samples/sample_reader.dart';

/// Mocks
class MockHotelsRepository extends Mock implements HotelsRepository {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  // Setup
  late MockHotelsRepository mockHotelsRepository;
  late FetchLatestSearchesInfo usecase;

  setUp(() {
    mockHotelsRepository = MockHotelsRepository();
    usecase = FetchLatestSearchesInfo(repository: mockHotelsRepository);
  });

  // Arrangements
  final tSearchesString = readFileAsString('search_data_sample.json');
  final tSearchesJson = json.decode(tSearchesString) as List<dynamic>;
  final tLatestSearches = tSearchesJson
      .map((e) => SearchDataModel.fromJson(e))
      .toList();

  void arrangeMockHotelsRepositoryToReturnSuccessResponse() {
    when(
      () => mockHotelsRepository.fetchLatestSearchesInfo(),
    ).thenAnswer((_) async => Right(tLatestSearches));
  }

  void arrangeMockHotelsRepositoryToReturnAFailure(Failure failure) {
    when(
      () => mockHotelsRepository.fetchLatestSearchesInfo(),
    ).thenAnswer((_) async => Left(failure));
  }

  // Test case
  group('FetchLatestSearchesInfo', () {
    test(
      'should call the fetchLatestSearchesInfo method from the repository',
      () async {
        // arrange
        arrangeMockHotelsRepositoryToReturnSuccessResponse();

        // act
        await usecase(NoParams());

        // assert
        verify(() => mockHotelsRepository.fetchLatestSearchesInfo()).called(1);
        verifyNoMoreInteractions(mockHotelsRepository);
      },
    );
    test('should get list of Search Data from the repository', () async {
      // Arrange
      arrangeMockHotelsRepositoryToReturnSuccessResponse();

      // Act
      final result = await usecase(NoParams());

      // Assert
      verify(() => mockHotelsRepository.fetchLatestSearchesInfo()).called(1);
      verifyNoMoreInteractions(mockHotelsRepository);
      expect(result, Right(tLatestSearches));
    });

    test('should return a server failure when the repository fails', () async {
      // Arrange
      const failure = ServerFailure(message: 'Server Failure');
      arrangeMockHotelsRepositoryToReturnAFailure(failure);

      // Act
      final result = await usecase(NoParams());

      // Assert
      verify(() => mockHotelsRepository.fetchLatestSearchesInfo()).called(1);
      verifyNoMoreInteractions(mockHotelsRepository);
      expect(result, Left(failure));
    });
  });
}
