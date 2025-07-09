import 'dart:convert';

import 'package:buenro_technical_task/core/errors/exceptions.dart';
import 'package:buenro_technical_task/core/errors/failures.dart';
import 'package:buenro_technical_task/core/errors/repository_call_handler.dart';
import 'package:buenro_technical_task/core/network/network_info.dart';
import 'package:buenro_technical_task/features/hotels/data/datasources/hotels_local_data_source.dart';
import 'package:buenro_technical_task/features/hotels/data/datasources/hotels_remote_data_source.dart';
import 'package:buenro_technical_task/features/hotels/data/models/properties_response_model.dart';
import 'package:buenro_technical_task/features/hotels/data/models/search_data_model.dart';
import 'package:buenro_technical_task/features/hotels/data/repositories/app_hotels_repositories.dart';
import 'package:buenro_technical_task/features/hotels/domain/repositories/hotels_repository.dart';
import 'package:buenro_technical_task/features/hotels/domain/usecases/search_for_hotels.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../samples/sample_reader.dart';

/// Mocks
class MockHotelsRemoteDataSource extends Mock
    implements HotelsRemoteDataSource {}

class MockHotelsLocalDataSource extends Mock implements HotelsLocalDataSource {}

/// Fakes
class FakeSearchHotelsParams extends Fake implements SearchHotelsParams {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  // Setup
  late MockHotelsRemoteDataSource mockHotelsRemoteDataSource;
  late MockHotelsLocalDataSource mockHotelsLocalDataSource;
  late RepositoryCallHandler callHandler;
  late NetworkInfo networkInfo;
  late HotelsRepository sut;

  setUp(() {
    mockHotelsRemoteDataSource = MockHotelsRemoteDataSource();
    mockHotelsLocalDataSource = MockHotelsLocalDataSource();
    networkInfo = AppNetworkInfo();
    callHandler = RepositoryCallHandler(networkInfo: networkInfo);

    sut = AppHotelsRepository(
      remoteDataSource: mockHotelsRemoteDataSource,
      localDataSource: mockHotelsLocalDataSource,
      callHandler: callHandler,
    );

    registerFallbackValue(FakeSearchHotelsParams());
  });

  // Arrangements
  const tQuery = 'Cairo';
  final tCheckInDate = '2025-07-12';
  final tCheckOutDate = '2025-07-19';
  const tNextPageToken = null;
  const tNumberOfAdults = 1;

  final tHotelsString = readFileAsString('hotels_response_sample.json');
  final tHotelsJson = json.decode(tHotelsString);
  final tResponse = PropertiesResponseModel.fromJson(tHotelsJson);

  final tSearchesString = readFileAsString('search_data_sample.json');
  final tSearchesJson = json.decode(tSearchesString) as List<dynamic>;
  final tLatestSearches = tSearchesJson
      .map((e) => SearchDataModel.fromJson(e))
      .toList();

  void arrangeMockHotelsDataSourcesToReturnSuccessResponse() {
    when(
      () => mockHotelsRemoteDataSource.searchForHotels(
        query: any(named: 'query'),
        checkInDate: any(named: 'checkInDate'),
        checkOutDate: any(named: 'checkOutDate'),
        nextPageToken: any(named: 'nextPageToken'),
        numberOfAdults: any(named: 'numberOfAdults'),
      ),
    ).thenAnswer((_) async => tResponse);

    when(
      () => mockHotelsLocalDataSource.fetchLatestSearchInfo(),
    ).thenAnswer((_) async => tLatestSearches);

    when(
      () => mockHotelsLocalDataSource.saveSearchInfo(tLatestSearches.first),
    ).thenAnswer((_) async => tLatestSearches.first);
  }

  void arrangeMockHotelsDataSourcesToThrowAnException(Exception exception) {
    when(
      () => mockHotelsRemoteDataSource.searchForHotels(
        query: any(named: 'query'),
        checkInDate: any(named: 'checkInDate'),
        checkOutDate: any(named: 'checkOutDate'),
        nextPageToken: any(named: 'nextPageToken'),
        numberOfAdults: any(named: 'numberOfAdults'),
      ),
    ).thenThrow(exception);

    when(
      () => mockHotelsLocalDataSource.fetchLatestSearchInfo(),
    ).thenThrow(exception);

    when(
      () => mockHotelsLocalDataSource.saveSearchInfo(tLatestSearches.first),
    ).thenThrow(exception);
  }

  // Test case
  group('searchForHotels', () {
    test(
      'should call the searchForHotels method from the repository',
      () async {
        // arrange
        arrangeMockHotelsDataSourcesToReturnSuccessResponse();

        // act
        await sut.searchForHotels(
          query: tQuery,
          checkInDate: tCheckInDate,
          checkOutDate: tCheckOutDate,
          nextPageToken: tNextPageToken,
          numberOfAdults: tNumberOfAdults,
        );

        // assert
        verify(
          () => mockHotelsRemoteDataSource.searchForHotels(
            query: tQuery,
            checkInDate: tCheckInDate,
            checkOutDate: tCheckOutDate,
            nextPageToken: tNextPageToken,
            numberOfAdults: tNumberOfAdults,
          ),
        ).called(1);
      },
    );
    test('should return a failure when the remote data source fails', () async {
      // arrange
      const tException = ServerException(message: 'Server error');
      arrangeMockHotelsDataSourcesToThrowAnException(tException);

      // act
      final result = await sut.searchForHotels(
        query: tQuery,
        checkInDate: tCheckInDate,
        checkOutDate: tCheckOutDate,
        nextPageToken: tNextPageToken,
        numberOfAdults: tNumberOfAdults,
      );

      // assert
      expect(result, Left(ServerFailure(message: tException.message)));
    });
    test(
      'should return a list of Hotels when the remote data source succeeds',
      () async {
        // arrange
        arrangeMockHotelsDataSourcesToReturnSuccessResponse();

        // act
        final result = await sut.searchForHotels(
          query: tQuery,
          checkInDate: tCheckInDate,
          checkOutDate: tCheckOutDate,
          nextPageToken: tNextPageToken,
          numberOfAdults: tNumberOfAdults,
        );

        // assert
        verify(
          () => mockHotelsRemoteDataSource.searchForHotels(
            query: tQuery,
            checkInDate: tCheckInDate,
            checkOutDate: tCheckOutDate,
            nextPageToken: tNextPageToken,
            numberOfAdults: tNumberOfAdults,
          ),
        ).called(1);
        expect(result, Right(tResponse));
        verifyNoMoreInteractions(mockHotelsRemoteDataSource);
      },
    );
  });

  group('fetchLatestSearchesInfo', () {
    test(
      'should call the fetchLatestSearchesInfo method from the repository',
      () async {
        // arrange
        arrangeMockHotelsDataSourcesToReturnSuccessResponse();

        // act
        await sut.fetchLatestSearchesInfo();

        // assert
        verify(
          () => mockHotelsLocalDataSource.fetchLatestSearchInfo(),
        ).called(1);
      },
    );
    test('should return a failure when the local data source fails', () async {
      // arrange
      const tException = ServerException(message: 'Server error');
      arrangeMockHotelsDataSourcesToThrowAnException(tException);

      // act
      final result = await sut.fetchLatestSearchesInfo();

      // assert
      expect(result, Left(ServerFailure(message: tException.message)));
    });
    test(
      'should return a list of Latest Searches when the local data source succeeds',
      () async {
        // arrange
        arrangeMockHotelsDataSourcesToReturnSuccessResponse();

        // act
        final result = await sut.fetchLatestSearchesInfo();

        // assert
        verify(
          () => mockHotelsLocalDataSource.fetchLatestSearchInfo(),
        ).called(1);
        expect(result, Right(tLatestSearches));
        verifyNoMoreInteractions(mockHotelsLocalDataSource);
      },
    );
  });
}
