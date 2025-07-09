import '../../domain/entities/gps_coordinates.dart';

class GPSCoordinatesModel extends GPSCoordinates {
  const GPSCoordinatesModel({
    required super.latitude,
    required super.longitude,
  });

  factory GPSCoordinatesModel.fromJson(Map<String, dynamic> parsedJson) {
    return GPSCoordinatesModel(
      latitude: parsedJson['latitude']?.toDouble() ?? 0.0,
      longitude: parsedJson['longitude']?.toDouble() ?? 0.0,
    );
  }
}
