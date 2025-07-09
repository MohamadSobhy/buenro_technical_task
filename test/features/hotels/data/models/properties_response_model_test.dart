import 'dart:convert';

import 'package:buenro_technical_task/features/hotels/data/models/properties_response_model.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../samples/sample_reader.dart';

void main() {
  /// Setup

  final tHotelsString = readFileAsString('hotels_response_sample.json');
  final tHotelsJson = json.decode(tHotelsString);

  /// Test cases
  group('PropertiesResponseModel.fromJson(json)', () {
    test(
      'should return a valid PropertiesResponseModel when the JSON is valid',
      () async {
        // arrange
        final tResponse = PropertiesResponseModel.fromJson(tHotelsJson);

        // act
        final result = PropertiesResponseModel.fromJson(tHotelsJson);

        // assert
        expect(result, tResponse);
      },
    );

    test('should correctly parse the JSON to PropertiesResponseModel', () async {
      // act
      final model = PropertiesResponseModel.fromJson(tHotelsJson);

      // assert
      expect(model.nextPageToken, "CBI=");
      expect(model.totalResults, 6033);
      expect(model.properties.length, 1);
      expect(model.properties.first.name, "The Ritz-Carlton, Bali");
      expect(model.properties.first.type, "hotel");
      expect(
        model.properties.first.description,
        "Zen-like quarters, some with butler service, in an upscale property offering refined dining & a spa.",
      );
      expect(
        model.properties.first.propertyToken,
        "ChkIv_HyiNKHpf6yARoML2cvMXozdGJnZ3BzEAE",
      );
      expect(model.properties.first.checkInTime, "3:00 PM");
      expect(model.properties.first.checkOutTime, "12:00 PM");
      expect(model.properties.first.hotelClass, "5-star hotel");
      expect(model.properties.first.extractedHotelClass, 5);
      expect(model.properties.first.reviews, 4128);
      expect(model.properties.first.locationRating, 2.9);
    });
  });
}
