import 'dart:convert';

import 'package:buenro_technical_task/core/errors/failures.dart';
import 'package:buenro_technical_task/features/hotels/data/models/properties_response_model.dart';
import 'package:buenro_technical_task/features/hotels/domain/repositories/hotels_repository.dart';
import 'package:buenro_technical_task/features/hotels/domain/usecases/search_for_hotels.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../samples/sample_reader.dart';

/// Mocks
class MockHotelsRepository extends Mock implements HotelsRepository {}

/// Fakes
class FakeSearchHotelsParams extends Fake implements SearchHotelsParams {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  // Setup
  late MockHotelsRepository mockHotelsRepository;
  late SearchForHotels usecase;

  setUp(() {
    mockHotelsRepository = MockHotelsRepository();
    usecase = SearchForHotels(repository: mockHotelsRepository);

    registerFallbackValue(FakeSearchHotelsParams());
  });

  // Arrangements
  final tHotelsString = readFileAsString('hotels_response_sample.json');
  final tHotelsJson = json.decode(tHotelsString);
  final tResponse = PropertiesResponseModel.fromJson(tHotelsJson);

  void arrangeMockHotelsRepositoryToReturnSuccessResponse() {
    when(
      () => mockHotelsRepository.searchForHotels(
        query: any(named: 'query'),
        checkInDate: any(named: 'checkInDate'),
        checkOutDate: any(named: 'checkOutDate'),
        nextPageToken: any(named: 'nextPageToken'),
        numberOfAdults: any(named: 'numberOfAdults'),
      ),
    ).thenAnswer((_) async => Right(tResponse));
  }

  void arrangeMockHotelsRepositoryToReturnAFailure(Failure failure) {
    when(
      () => mockHotelsRepository.searchForHotels(
        query: any(named: 'query'),
        checkInDate: any(named: 'checkInDate'),
        checkOutDate: any(named: 'checkOutDate'),
        nextPageToken: any(named: 'nextPageToken'),
        numberOfAdults: any(named: 'numberOfAdults'),
      ),
    ).thenAnswer((_) async => Left(failure));
  }

  // Test case
  group('SearchForHotels', () {
    test(
      'should call the searchForHotels method from the repository',
      () async {
        // arrange
        const query = 'Cairo';
        final checkInDate = '2025-07-12';
        final checkOutDate = '2025-07-19';
        const nextPageToken = null;
        const numberOfAdults = 1;
        arrangeMockHotelsRepositoryToReturnSuccessResponse();

        // act
        await usecase(
          SearchHotelsParams(
            query: query,
            checkInDate: checkInDate,
            checkOutDate: checkOutDate,
            nextPageToken: nextPageToken,
            numberOfAdults: numberOfAdults,
          ),
        );

        // assert
        verify(
          () => mockHotelsRepository.searchForHotels(
            query: query,
            checkInDate: checkInDate,
            checkOutDate: checkOutDate,
            nextPageToken: nextPageToken,
            numberOfAdults: numberOfAdults,
          ),
        ).called(1);
        verifyNoMoreInteractions(mockHotelsRepository);
      },
    );
    test('should get list of Hotels from the repository', () async {
      // Arrange
      const query = 'Cairo';
      final checkInDate = '2025-07-12';
      final checkOutDate = '2025-07-19';
      const nextPageToken = null;
      const numberOfAdults = 1;
      arrangeMockHotelsRepositoryToReturnSuccessResponse();

      // Act
      final result = await usecase(
        SearchHotelsParams(
          query: query,
          checkInDate: checkInDate,
          checkOutDate: checkOutDate,
          nextPageToken: nextPageToken,
          numberOfAdults: numberOfAdults,
        ),
      );

      // Assert
      verify(
        () => mockHotelsRepository.searchForHotels(
          query: query,
          checkInDate: checkInDate,
          checkOutDate: checkOutDate,
          nextPageToken: nextPageToken,
          numberOfAdults: numberOfAdults,
        ),
      ).called(1);
      verifyNoMoreInteractions(mockHotelsRepository);
      expect(result, Right(tResponse));
    });

    test('should return a server failure when the repository fails', () async {
      // Arrange
      const query = 'Cairo';
      final checkInDate = '2025-07-12';
      final checkOutDate = '2025-07-19';
      const nextPageToken = null;
      const numberOfAdults = 1;
      const failure = ServerFailure(message: 'Server Failure');
      arrangeMockHotelsRepositoryToReturnAFailure(failure);

      // Act
      final result = await usecase(
        SearchHotelsParams(
          query: query,
          checkInDate: checkInDate,
          checkOutDate: checkOutDate,
          nextPageToken: nextPageToken,
          numberOfAdults: numberOfAdults,
        ),
      );

      // Assert
      verify(
        () => mockHotelsRepository.searchForHotels(
          query: query,
          checkInDate: checkInDate,
          checkOutDate: checkOutDate,
          nextPageToken: nextPageToken,
          numberOfAdults: numberOfAdults,
        ),
      ).called(1);
      verifyNoMoreInteractions(mockHotelsRepository);
      expect(result, Left(failure));
    });
  });
}
