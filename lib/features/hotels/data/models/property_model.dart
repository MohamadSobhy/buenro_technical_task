import '../../domain/entities/property.dart';
import 'gps_coordinates_model.dart';

class PropertyModel extends Property {
  const PropertyModel({
    required super.type,
    required super.description,
    required super.checkInTime,
    required super.checkOutTime,
    required super.nearbyPlaces,
    required super.hotelClass,
    required super.extractedHotelClass,
    required super.images,
    required super.ratings,
    required super.locationRating,
    required super.reviewsBreakdown,
    required super.name,
    required super.source,
    required super.sourceIcon,
    required super.link,
    required super.propertyToken,
    required super.serpapiPropertyDetailsLink,
    required super.gpsCoordinates,
    required super.thumbnail,
    required super.overallRating,
    required super.reviews,
    required super.price,
    required super.extractedPrice,
    required super.amenities,
  });

  factory PropertyModel.fromJson(Map<String, dynamic> parsedJson) {
    return PropertyModel(
      type: parsedJson['type'] ?? '',
      description: parsedJson['description'] ?? '',
      checkInTime: parsedJson['check_in_time'] ?? '',
      checkOutTime: parsedJson['check_out_time'] ?? '',
      nearbyPlaces: ((parsedJson['nearby_places'] ?? []) as List<dynamic>)
          .map((place) => NearbyPlaceModel.fromJson(place))
          .toList(),
      hotelClass: parsedJson['hotel_class']?.toString() ?? '',
      extractedHotelClass: parsedJson['extracted_hotel_class'] ?? 0,
      images: ((parsedJson['images'] ?? []) as List<dynamic>)
          .map((image) => ImageInfoModel.fromJson(image))
          .toList(),
      ratings: ((parsedJson['ratings'] ?? []) as List<dynamic>)
          .map((rating) => RatingModel.fromJson(rating))
          .toList(),
      locationRating: parsedJson['location_rating']?.toDouble() ?? 0.0,
      reviewsBreakdown:
          ((parsedJson['reviews_breakdown'] ?? []) as List<dynamic>)
              .map((review) => ReviewsBreakdownModel.fromJson(review))
              .toList(),
      name: parsedJson['name'] ?? '',
      source: parsedJson['source'] ?? '',
      sourceIcon: parsedJson['source_icon'] ?? '',
      link: parsedJson['link'] ?? '',
      propertyToken: parsedJson['property_token'] ?? '',
      serpapiPropertyDetailsLink:
          parsedJson['serpapi_property_details_link'] ?? '',
      gpsCoordinates: GPSCoordinatesModel.fromJson(
        parsedJson['gps_coordinates'],
      ),
      thumbnail: parsedJson['thumbnail'] ?? '',
      overallRating: parsedJson['overall_rating']?.toDouble() ?? 0.0,
      reviews: parsedJson['reviews']?.toInt() ?? 0,
      price: parsedJson['price'] ?? '',
      extractedPrice: parsedJson['extracted_price']?.toDouble() ?? 0.0,
      amenities: List<String>.from(parsedJson['amenities'] ?? []),
    );
  }

  @override
  List<Object?> get props => [
    type,
    description,
    checkInTime,
    checkOutTime,
    nearbyPlaces,
    hotelClass,
    extractedHotelClass,
    images,
    ratings,
    locationRating,
    reviewsBreakdown,
    name,
    source,
    sourceIcon,
    link,
    propertyToken,
    serpapiPropertyDetailsLink,
    gpsCoordinates,
    thumbnail,
    overallRating,
    reviews,
    price,
    extractedPrice,
    amenities,
  ];
}

class NearbyPlaceModel extends NearbyPlace {
  const NearbyPlaceModel({required super.name, required super.transportations});

  factory NearbyPlaceModel.fromJson(Map<String, dynamic> parsedJson) {
    return NearbyPlaceModel(
      name: parsedJson['name'] ?? '',
      transportations: ((parsedJson['transportations'] ?? []) as List<dynamic>)
          .map((transportation) => TransportationModel.fromJson(transportation))
          .toList(),
    );
  }

  @override
  List<Object?> get props => [name, transportations];
}

class TransportationModel extends Transportation {
  const TransportationModel({required super.duration, required super.type});

  factory TransportationModel.fromJson(Map<String, dynamic> parsedJson) {
    return TransportationModel(
      type: parsedJson['type'] ?? '',
      duration: parsedJson['duration'] ?? '',
    );
  }

  @override
  List<Object?> get props => [duration, type];
}

class ImageInfoModel extends ImageInfo {
  const ImageInfoModel({
    required super.thumbnail,
    required super.originalImage,
  });

  factory ImageInfoModel.fromJson(Map<String, dynamic> parsedJson) {
    return ImageInfoModel(
      thumbnail: parsedJson['thumbnail'] ?? '',
      originalImage: parsedJson['original_image'] ?? '',
    );
  }

  @override
  List<Object?> get props => [thumbnail, originalImage];
}

class RatingModel extends Rating {
  const RatingModel({required super.stars, required super.count});

  factory RatingModel.fromJson(Map<String, dynamic> parsedJson) {
    return RatingModel(
      stars: parsedJson['stars']?.toInt() ?? 0,
      count: parsedJson['count']?.toInt() ?? 0,
    );
  }

  @override
  List<Object?> get props => [stars, count];
}

class ReviewsBreakdownModel extends ReviewsBreakdown {
  const ReviewsBreakdownModel({
    required super.name,
    required super.description,
    required super.totalMentioned,
    required super.positive,
    required super.negative,
    required super.neutral,
  });

  factory ReviewsBreakdownModel.fromJson(Map<String, dynamic> parsedJson) {
    return ReviewsBreakdownModel(
      name: parsedJson['name'] ?? '',
      description: parsedJson['description'] ?? '',
      totalMentioned: parsedJson['total_mentioned']?.toInt() ?? 0,
      positive: parsedJson['positive']?.toInt() ?? 0,
      negative: parsedJson['negative']?.toInt() ?? 0,
      neutral: parsedJson['neutral']?.toInt() ?? 0,
    );
  }

  @override
  List<Object?> get props => [
    name,
    description,
    totalMentioned,
    positive,
    negative,
    neutral,
  ];
}
