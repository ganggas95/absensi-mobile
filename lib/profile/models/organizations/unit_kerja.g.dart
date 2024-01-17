// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unit_kerja.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UnitKerja _$UnitKerjaFromJson(Map<String, dynamic> json) => UnitKerja(
      id: json['id'] as int?,
      latLng: json['lat_lng'] == null
          ? null
          : LatLng.fromJson(json['lat_lng'] as Map<String, dynamic>),
      name: json['name'] as String?,
    );

Map<String, dynamic> _$UnitKerjaToJson(UnitKerja instance) => <String, dynamic>{
      'id': instance.id,
      'lat_lng': instance.latLng,
      'name': instance.name,
    };
