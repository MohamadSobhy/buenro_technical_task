import 'package:equatable/equatable.dart';

import 'gps_coordinates.dart';

abstract class Property extends Equatable {
  final String type;
  final String description;
  final String checkInTime;
  final String checkOutTime;
  final List<NearbyPlace> nearbyPlaces;
  final String hotelClass;
  final int extractedHotelClass;
  final List<ImageInfo> images;
  final List<Rating> ratings;
  final num locationRating;
  final List<ReviewsBreakdown> reviewsBreakdown;
  final String name;
  final String source;
  final String sourceIcon;
  final String link;
  final String propertyToken;
  final String serpapiPropertyDetailsLink;
  final GPSCoordinates gpsCoordinates;
  final String thumbnail;
  final double overallRating;
  final int reviews;
  final String price;
  final num extractedPrice;
  final List<String> amenities;

  const Property({
    required this.type,
    required this.description,
    required this.checkInTime,
    required this.checkOutTime,
    required this.nearbyPlaces,
    required this.hotelClass,
    required this.extractedHotelClass,
    required this.images,
    required this.ratings,
    required this.locationRating,
    required this.reviewsBreakdown,
    required this.name,
    required this.source,
    required this.sourceIcon,
    required this.link,
    required this.propertyToken,
    required this.serpapiPropertyDetailsLink,
    required this.gpsCoordinates,
    required this.thumbnail,
    required this.overallRating,
    required this.reviews,
    required this.price,
    required this.extractedPrice,
    required this.amenities,
  });

  Map<String, dynamic> toJson();
}

abstract class NearbyPlace extends Equatable {
  final String name;
  final List<Transportation> transportations;

  const NearbyPlace({required this.name, required this.transportations});

  Map<String, dynamic> toJson();
}

abstract class Transportation extends Equatable {
  final String type;
  final String duration;

  const Transportation({required this.type, required this.duration});

  Map<String, dynamic> toJson();
}

abstract class ImageInfo extends Equatable {
  final String thumbnail;
  final String originalImage;

  const ImageInfo({required this.thumbnail, required this.originalImage});

  Map<String, dynamic> toJson();
}

abstract class Rating extends Equatable {
  final int stars;
  final int count;

  const Rating({required this.stars, required this.count});

  Map<String, dynamic> toJson();
}

abstract class ReviewsBreakdown extends Equatable {
  final String name;
  final String description;
  final int totalMentioned;
  final int positive;
  final int negative;
  final int neutral;

  const ReviewsBreakdown({
    required this.name,
    required this.description,
    required this.totalMentioned,
    required this.positive,
    required this.negative,
    required this.neutral,
  });

  Map<String, dynamic> toJson();
}
