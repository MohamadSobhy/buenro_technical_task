import 'dart:convert';

import 'package:buenro_technical_task/features/hotels/data/models/search_data_model.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../samples/sample_reader.dart';

void main() {
  /// Setup

  final tSearchesString = readFileAsString('search_data_sample.json');
  final tSearchJson = (json.decode(tSearchesString) as List<dynamic>).first;

  /// Test cases
  group('SearchDataModel.fromJson(json)', () {
    test(
      'should return a valid SearchDataModel when the JSON is valid',
      () async {
        // arrange
        final tLatestSearch = SearchDataModel.fromJson(tSearchJson);

        // act
        final result = SearchDataModel.fromJson(tSearchJson);

        // assert
        expect(result, tLatestSearch);
      },
    );

    test('should correctly parse the JSON to SearchDataModel', () async {
      // act
      final model = SearchDataModel.fromJson(tSearchJson);

      // assert
      expect(model.query, "Cairo");
      expect(model.checkInDate, "2025-07-12");
      expect(model.checkOutDate, "2025-07-19");
      expect(model.numberOfAdults, 1);
    });
  });
}
