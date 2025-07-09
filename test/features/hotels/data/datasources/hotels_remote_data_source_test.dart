import 'dart:convert';

import 'package:buenro_technical_task/core/api/api_service.dart';
import 'package:buenro_technical_task/core/errors/exceptions.dart';
import 'package:buenro_technical_task/features/hotels/data/datasources/hotels_remote_data_source.dart';
import 'package:buenro_technical_task/features/hotels/data/models/properties_response_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../samples/sample_reader.dart';

/// Mocks
class MockApiService extends Mock implements ApiService {}

void main() {
  /// Setup
  late MockApiService mockApiService;
  late AppHotelsRemoteDataSource sut;

  setUp(() {
    mockApiService = MockApiService();
    sut = AppHotelsRemoteDataSource();

    sut.setMockService = mockApiService;
  });

  /// Arrangements
  const tQuery = 'Cairo';
  final tCheckInDate = '2025-07-12';
  final tCheckOutDate = '2025-07-19';
  const tNextPageToken = null;
  const tNumberOfAdults = 1;

  final tHotelsString = readFileAsString('hotels_response_sample.json');
  final tErrorResString = readFileAsString('hotels_error_response_sample.json');
  final tErrorJson = json.decode(tErrorResString);
  final tHotelsJson = json.decode(tHotelsString);
  final tResponse = PropertiesResponseModel.fromJson(tHotelsJson);

  void arrangeMockApiServiceToReturnSuccessResponse() {
    when(
      () => mockApiService.get(
        url: any(named: 'url'),
        query: any(named: 'query'),
        headers: any(named: 'headers'),
      ),
    ).thenAnswer((_) async => tHotelsJson);
  }

  void arrangeMockApiServiceToReturnFailueResponse() {
    when(
      () => mockApiService.get(
        url: any(named: 'url'),
        query: any(named: 'query'),
        headers: any(named: 'headers'),
      ),
    ).thenThrow(ServerException(message: tErrorJson['error']));
  }

  /// Test cases
  group('AppHotelsRemoteDataSource', () {
    group('[searchForHotels()]', () {
      test(
        'should return a valid PropertiesResponseModel when the api service return valid response',
        () async {
          // arrange
          arrangeMockApiServiceToReturnSuccessResponse();

          // act
          final result = await sut.searchForHotels(
            query: tQuery,
            checkInDate: tCheckInDate,
            checkOutDate: tCheckOutDate,
            nextPageToken: tNextPageToken,
            numberOfAdults: tNumberOfAdults,
          );

          // assert
          expect(result, tResponse);
        },
      );

      test(
        'should throw a ServerException with the error message when the API service fails',
        () async {
          // act
          arrangeMockApiServiceToReturnFailueResponse();

          // act
          final result = sut.searchForHotels(
            query: tQuery,
            checkInDate: tCheckInDate,
            checkOutDate: tCheckOutDate,
            nextPageToken: tNextPageToken,
            numberOfAdults: tNumberOfAdults,
          );

          // assert
          expect(() => result, throwsA(isA<ServerException>()));
        },
      );
    });
  });
}
