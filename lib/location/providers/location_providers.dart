import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:sitampan_mobile/location/models/location.dart';
import 'package:sitampan_mobile/misc/location_utils.dart';
import 'package:sitampan_mobile/providers/settings_providers.dart';

class LocationStateNotifier extends StateNotifier<MyLocationState> {
  final Ref ref;
  LocationStateNotifier({required this.ref}) : super(const MyLocationState());

  void updateMyPosition(Position myPosition) {
    state = state.copyWith(
        myCoordinate: state.myCoordinate, myPosition: myPosition);
  }

  void updateMyCoordinate(LatLng myCoordinate) {
    state = state.copyWith(
        myCoordinate: myCoordinate, myPosition: state.myPosition);
  }

  bool get myLocationWithinOfficeLocation {
    final opd = ref.watch(settingsProviders).user!.opd;
    if (opd == null || opd.latLng == null) {
      return false;
    }
    if (state.myCoordinate != null) {
      return isCoordinateInsideRadius(
        opd.latLng!.coordinates!.last,
        opd.latLng!.coordinates!.first,
        10,
        state.myCoordinate!.latitude,
        state.myCoordinate!.longitude,
      );
    }
    return false;
  }
}

final locationProviders =
    StateNotifierProvider<LocationStateNotifier, MyLocationState>(
        (ref) => LocationStateNotifier(ref: ref));
