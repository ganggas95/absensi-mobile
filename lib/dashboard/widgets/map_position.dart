import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:sitampan_mobile/misc/tile_providers.dart';

class MapPositionWidget extends StatefulWidget {
  const MapPositionWidget({super.key});

  @override
  State<MapPositionWidget> createState() => _MapPositionWidgetState();
}

class _MapPositionWidgetState extends State<MapPositionWidget> {
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
    positionStream = Geolocator.getPositionStream(
        locationSettings: const LocationSettings(
      accuracy: LocationAccuracy.high,
      distanceFilter: 10,
      timeLimit: Duration(seconds: 10),
    )).listen((Position value) {
      mapController.move(LatLng(value.latitude, value.longitude), 17);

      placemarkFromCoordinates(value.latitude, value.longitude).then((pos) {
        setState(() {
          locationInfo = pos[0].street!;
        });
      });
      setState(() {
        position = value;
      });
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
    LatLng? latLng;
    if (position != null) {
      latLng = LatLng(position!.latitude, position!.longitude);
    } else {
      latLng = const LatLng(-8.335732, 116.215203);
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
                    initialCenter: latLng,
                    initialZoom: 18,
                  ),
                  children: [
                    openStreetMapTileLayer,
                    MarkerLayer(alignment: Alignment.center, markers: [
                      Marker(
                          point: latLng,
                          child: const Icon(
                            Icons.location_pin,
                            color: Colors.red,
                          ))
                    ]),
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
              Text(
                "Lokasi Anda: $locationInfo",
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                ),
              )
            ])
      ],
    );
  }
}
