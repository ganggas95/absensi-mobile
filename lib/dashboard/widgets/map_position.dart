import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:sitampan_mobile/location/providers/location_providers.dart';
import 'package:sitampan_mobile/misc/tile_providers.dart';
import 'package:sitampan_mobile/providers/settings_providers.dart';

class MapPositionWidget extends ConsumerStatefulWidget {
  const MapPositionWidget({super.key});

  @override
  ConsumerState<MapPositionWidget> createState() => _MapPositionWidgetState();
}

class _MapPositionWidgetState extends ConsumerState<MapPositionWidget> {
  final mapController = MapController();
  Position? position;
  String locationInfo = '';
  late StreamSubscription<Position> positionStream;

  Future<void> _checkPositionPermission() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
  }

  void _updatePosition() {
    final myLocationRef = ref.read(locationProviders.notifier);
    positionStream = Geolocator.getPositionStream(
        locationSettings: const LocationSettings(
      accuracy: LocationAccuracy.bestForNavigation,
      distanceFilter: 0,
      timeLimit: Duration(seconds: 10),
    )).listen((Position value) {
      LatLng latLng = LatLng(value.latitude, value.longitude);
      mapController.move(latLng, 20);

      placemarkFromCoordinates(value.latitude, value.longitude).then((pos) {
        myLocationRef.updateMyPosition(value);
      });
      myLocationRef.updateMyCoordinate(latLng);
      print('${value.latitude} ${value.longitude}');
    });
  }

  @override
  void initState() {
    super.initState();
    _checkPositionPermission().then((value) => _updatePosition());
  }

  @override
  void dispose() {
    positionStream.cancel();
    mapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const LatLng defaultLatLng = LatLng(-8.335732, 116.215203);
    LatLng? latLngOpd;
    final myCoordinate = ref.watch(locationProviders).myCoordinate;

    List<Marker> markers = [];
    if (myCoordinate != null) {
      markers.add(Marker(
          point: myCoordinate,
          child: const Icon(
            Icons.person_pin,
            color: Colors.red,
          )));
    }

    final opd = ref.watch(settingsProviders).user!.opd;
    if (opd!.latLng != null) {
      latLngOpd =
          LatLng(opd.latLng!.coordinates!.last, opd.latLng!.coordinates!.first);
      markers.add(Marker(
          point: latLngOpd,
          child: const Icon(
            Icons.location_on,
            color: Colors.blue,
          )));
    }
    return Column(
      children: [
        Card(
          elevation: 20,
          shadowColor: Colors.grey,
          margin: const EdgeInsets.all(10),
          clipBehavior: Clip.hardEdge,
          child: Container(
              height: 200,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: FlutterMap(
                  mapController: mapController,
                  options: MapOptions(
                    initialCenter: myCoordinate ?? defaultLatLng,
                    initialZoom: 20,
                  ),
                  children: [
                    openStreetMapTileLayer,
                    MarkerLayer(alignment: Alignment.center, markers: markers),
                    CircleLayer(
                      circles: [
                        CircleMarker(
                            point: latLngOpd!,
                            radius: 10,
                            useRadiusInMeter: true,
                            color: Colors.blue.withOpacity(0.3)),
                      ],
                    ),
                  ])),
        ),
        Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Center(
                child: Icon(
                  Icons.place,
                  color: Colors.redAccent,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              (myCoordinate != null)
                  ? Text(
                      "Lokasi Anda: ${myCoordinate.latitude} - ${myCoordinate.longitude}",
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    )
                  : const SizedBox(),
            ])
      ],
    );
  }
}
