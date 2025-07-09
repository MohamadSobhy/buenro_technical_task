import '../../domain/entities/properties_response.dart';
import '../../domain/entities/property.dart';
import 'property_model.dart';

class PropertiesResponseModel extends PropertiesResponse {
  const PropertiesResponseModel({
    required super.nextPageToken,
    required super.totalResults,
    required super.ads,
    required super.properties,
  });

  factory PropertiesResponseModel.fromJson(Map<String, dynamic> parsedJson) {
    return PropertiesResponseModel(
      nextPageToken: parsedJson['serpapi_pagination']?['next_page_token'],
      totalResults:
          parsedJson['search_information']?['total_results']?.toInt() ?? 0,
      ads: ((parsedJson['ads'] ?? []) as List<dynamic>)
          .map((ad) => PropertyModel.fromJson(ad))
          .toList(),
      properties: ((parsedJson['properties'] ?? []) as List<dynamic>)
          .map((property) => PropertyModel.fromJson(property))
          .toList(),
    );
  }

  @override
  PropertiesResponse copyWith({List<Property>? properties}) {
    return PropertiesResponseModel(
      nextPageToken: nextPageToken,
      totalResults: totalResults,
      ads: ads,
      properties: properties ?? this.properties,
    );
  }

  @override
  List<Object?> get props => [nextPageToken, totalResults, ads, properties];
}
