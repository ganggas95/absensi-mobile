// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'opd.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Opd _$OpdFromJson(Map<String, dynamic> json) => Opd(
      id: json['id'] as int?,
      latLng: json['lat_lng'] == null
          ? null
          : LatLng.fromJson(json['lat_lng'] as Map<String, dynamic>),
      name: json['name'] as String?,
    );

Map<String, dynamic> _$OpdToJson(Opd instance) => <String, dynamic>{
      'id': instance.id,
      'lat_lng': instance.latLng,
      'name': instance.name,
    };
