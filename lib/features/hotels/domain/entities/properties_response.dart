import 'package:equatable/equatable.dart';

import 'property.dart';

abstract class PropertiesResponse extends Equatable {
  final String? nextPageToken;
  final int totalResults;
  final List<Property> ads;
  final List<Property> properties;

  const PropertiesResponse({
    required this.nextPageToken,
    required this.totalResults,
    required this.ads,
    required this.properties,
  });

  PropertiesResponse copyWith({List<Property>? properties});
}
