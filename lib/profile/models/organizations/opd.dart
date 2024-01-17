import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';

import 'lat_lng.dart';

part 'opd.g.dart';

@JsonSerializable()
class Opd {
  final int? id;
  @JsonKey(name: 'lat_lng')
  final LatLng? latLng;
  final String? name;

  const Opd({this.id, this.latLng, this.name});

  @override
  String toString() => 'Opd(id: $id, latLng: $latLng, name: $name)';

  factory Opd.fromJson(Map<String, dynamic> json) => _$OpdFromJson(json);

  Map<String, dynamic> toJson() => _$OpdToJson(this);

  Opd copyWith({
    int? id,
    LatLng? latLng,
    String? name,
  }) {
    return Opd(
      id: id ?? this.id,
      latLng: latLng ?? this.latLng,
      name: name ?? this.name,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Opd) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode => id.hashCode ^ latLng.hashCode ^ name.hashCode;
}
