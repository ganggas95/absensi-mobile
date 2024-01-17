import 'package:geolocator/geolocator.dart';

bool isCoordinateInsideRadius(double latitude, double longitude, double radius,
    double targetLatitude, double targetLongitude) {
  double distance = Geolocator.distanceBetween(
      latitude, longitude, targetLatitude, targetLongitude);
  return distance <= radius;
}
