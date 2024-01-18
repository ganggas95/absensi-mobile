class CreateAttendanceDTO {
  final double lat;
  final double lng;
  const CreateAttendanceDTO({required this.lat, required this.lng});

  factory CreateAttendanceDTO.fromJson(Map<String, dynamic> json) {
    return CreateAttendanceDTO(lat: json['lat'], lng: json['lng']);
  }

  Map<String, dynamic> toJson() {
    return {'lat': lat.toString(), 'lng': lng.toString()};
  }
}
