import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';

part 'lat_lng.g.dart';

@JsonSerializable()
class LatLng {
  final List<double>? coordinates;
  final String? type;

  const LatLng({this.coordinates, this.type});

  @override
  String toString() => 'LatLng(coordinates: $coordinates, type: $type)';

  factory LatLng.fromJson(Map<String, dynamic> json) {
    return _$LatLngFromJson(json);
  }

  Map<String, dynamic> toJson() => _$LatLngToJson(this);

  LatLng copyWith({
    List<double>? coordinates,
    String? type,
  }) {
    return LatLng(
      coordinates: coordinates ?? this.coordinates,
      type: type ?? this.type,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! LatLng) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode => coordinates.hashCode ^ type.hashCode;
}
