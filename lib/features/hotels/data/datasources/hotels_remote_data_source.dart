import 'package:flutter/material.dart';

import '../../../../core/api/api_config.dart';
import '../../../../core/api/api_service.dart';
import '../../../../core/api/remote_api_service.dart';
import '../models/properties_response_model.dart';

abstract class HotelsRemoteDataSource {
  /// Searches for hotels based on the provided query and date range.
  ///
  /// [query] is the search term for hotel names or locations.
  /// [checkInDate] is the date when the stay begins.
  /// [checkOutDate] is the date when the stay ends.
  /// [nextPageToken] is used for pagination to fetch the next set of results.
  /// [numberOfAdults] specifies how many adults are included in the search.
  ///
  /// Returns a [PropertiesResponse] containing the search results or an error.
  Future<PropertiesResponseModel> searchForHotels({
    required String query,
    required String checkInDate,
    required String checkOutDate,
    String? nextPageToken,
    int numberOfAdults = 1,
  });
}

class AppHotelsRemoteDataSource extends HotelsRemoteDataSource {
  ApiService _apiService = RemoteApiService.api;

  @visibleForTesting
  set setMockService(ApiService service) => _apiService = service;

  @override
  Future<PropertiesResponseModel> searchForHotels({
    required String query,
    required String checkInDate,
    required String checkOutDate,
    String? nextPageToken,
    int numberOfAdults = 1,
  }) async {
    final parsedJson = await _apiService.get(
      url: ApiResource.searchHotelsEndpoint(
        query: query,
        checkInDate: checkInDate,
        checkOutDate: checkOutDate,
        nextPageToken: nextPageToken,
        numberOfAdults: numberOfAdults,
      ),
    );

    return PropertiesResponseModel.fromJson(parsedJson);
  }
}
