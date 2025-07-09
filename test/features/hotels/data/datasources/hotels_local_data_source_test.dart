import 'dart:convert';

import 'package:buenro_technical_task/core/constants/constant_keys.dart';
import 'package:buenro_technical_task/core/errors/exceptions.dart';
import 'package:buenro_technical_task/features/hotels/data/datasources/hotels_Local_data_source.dart';
import 'package:buenro_technical_task/features/hotels/data/models/search_data_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../samples/sample_reader.dart';

/// Mocks
class MockHiveInterface extends Mock implements HiveInterface {}

class MockHiveBox extends Mock implements Box {}

void main() {
  /// Setup
  late MockHiveInterface mockHiveInterface;
  late MockHiveBox mockHiveBox;
  late AppHotelsLocalDataSource sut;

  setUp(() {
    mockHiveInterface = MockHiveInterface();
    mockHiveBox = MockHiveBox();
    sut = AppHotelsLocalDataSource(hive: mockHiveInterface);
  });

  /// Arrangements

  final tSearchesString = readFileAsString('search_data_sample.json');
  final tSearchesJson = json.decode(tSearchesString) as List<dynamic>;
  final tLatestSearches = tSearchesJson
      .map((e) => SearchDataModel.fromJson(e))
      .toList();

  void arrangeMockHiveInterfaceToReturnSuccessResponse() {
    when(
      () => mockHiveInterface.isBoxOpen(any<String>()),
    ).thenAnswer((_) => true);

    when(
      () => mockHiveInterface.openBox(any<String>()),
    ).thenAnswer((_) async => mockHiveBox);

    when(
      () => mockHiveBox.get(ConstantKeys.latestSearchesDataKey),
    ).thenAnswer((_) => tSearchesString);

    when(
      () => mockHiveBox.put(ConstantKeys.latestSearchesDataKey, any<String>()),
    ).thenAnswer((_) async {});
  }

  void arrangeMockHiveInterfaceToReturnFailueResponse() {
    when(
      () => mockHiveInterface.openBox(any<String>()),
    ).thenThrow(CacheException(message: 'Error'));
  }

  /// Test cases
  group('AppHotelsLocalDataSource', () {
    group('[fetchLatestSearchesInfo()]', () {
      test(
        'should return a valid List of SearchData when the local storage return valid response',
        () async {
          // arrange
          arrangeMockHiveInterfaceToReturnSuccessResponse();

          // act
          final result = await sut.fetchLatestSearchInfo();

          // assert
          expect(result, tLatestSearches);
        },
      );

      test(
        'should throw a CacheException with an error message when the local storage fails',
        () async {
          // act
          arrangeMockHiveInterfaceToReturnFailueResponse();

          // act
          final result = sut.fetchLatestSearchInfo();

          // assert
          expect(() => result, throwsA(isA<CacheException>()));
        },
      );
    });

    group('[saveSearchInfo()]', () {
      test(
        'should return a valid SearchData when the SearchData stored successfully in local storage',
        () async {
          // arrange
          arrangeMockHiveInterfaceToReturnSuccessResponse();

          // act
          final result = await sut.saveSearchInfo(tLatestSearches.first);

          // assert
          expect(result, tLatestSearches.first);
        },
      );

      test(
        'should throw a CacheException with an error message when saving SearchData into the local storage fails',
        () async {
          // act
          arrangeMockHiveInterfaceToReturnFailueResponse();

          // act
          final result = sut.saveSearchInfo(tLatestSearches.first);

          // assert
          expect(() => result, throwsA(isA<CacheException>()));
        },
      );
    });
  });
}
