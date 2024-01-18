import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:sitampan_mobile/attendance/dto/attendance_dto.dart';
import 'package:sitampan_mobile/attendance/providers/attendance_providers.dart';
import 'package:sitampan_mobile/location/providers/location_providers.dart';

class AttendanceActionWidget extends ConsumerStatefulWidget {
  const AttendanceActionWidget({super.key});

  @override
  ConsumerState<AttendanceActionWidget> createState() =>
      _AttendanceActionWidgetState();
}

class _AttendanceActionWidgetState
    extends ConsumerState<AttendanceActionWidget> {
  bool isCoordinateInsideRadius(double latitude, double longitude,
      double radius, double targetLatitude, double targetLongitude) {
    double distance = Geolocator.distanceBetween(
        latitude, longitude, targetLatitude, targetLongitude);
    return distance <= radius;
  }

  void onTabAttend() {
    final myCoordinate = ref.watch(locationProviders).myCoordinate;
    final myLocationWithinOfficeLocation =
        ref.watch(locationProviders.notifier).myLocationWithinOfficeLocation;
    if (myLocationWithinOfficeLocation) {
      ref.read(attendanceProviders.notifier).sendAttendance(CreateAttendanceDTO(
          lat: myCoordinate!.latitude, lng: myCoordinate.longitude));
    } else {
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Lokasi Anda diluar area kerja"),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    final attendance = ref.watch(attendanceProviders).todayAtt;
    return InkWell(
      onTap: onTabAttend,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 28),
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.blueGrey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 1), // changes position of shadow
            ),
          ],
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          gradient: LinearGradient(colors: [
            Theme.of(context).primaryColor.withOpacity(0.8),
            Theme.of(context).primaryColor.withOpacity(0.9)
          ], begin: Alignment.topRight, end: Alignment.bottomLeft),
        ),
        child: Column(
          children: [
            const Icon(
              Icons.pan_tool_alt,
              size: 32,
              color: Colors.white,
            ),
            Text(
                attendance != null && attendance.checkIn != null
                    ? "Keluar"
                    : "Masuk",
                style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.white))
          ],
        ),
      ),
    );
  }
}
