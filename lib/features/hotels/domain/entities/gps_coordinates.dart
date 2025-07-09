import 'package:equatable/equatable.dart';

abstract class GPSCoordinates extends Equatable {
  final double latitude;
  final double longitude;

  const GPSCoordinates({required this.latitude, required this.longitude});

  @override
  List<Object?> get props => [latitude, longitude];
}
