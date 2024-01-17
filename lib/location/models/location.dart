import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';

class MyLocationState {
  final LatLng? myCoordinate;
  final Position? myPosition;

  const MyLocationState({this.myCoordinate, this.myPosition});

  MyLocationState copyWith({
    LatLng? myCoordinate,
    Position? myPosition,
  }) {
    return MyLocationState(myCoordinate: myCoordinate, myPosition: myPosition);
  }
}
