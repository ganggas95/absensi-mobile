class CreateAttendanceDTO {
  final double lat;
  final double lng;
  const CreateAttendanceDTO({required this.lat, required this.lng});

  Map<String, dynamic> toJson() {
    return {'lat': lat.toString(), 'lng': lng.toString()};
  }
}
