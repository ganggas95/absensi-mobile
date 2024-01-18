// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'att_record.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AttendanceRecord _$AttendanceRecordFromJson(Map<String, dynamic> json) =>
    AttendanceRecord(
      id: json['id'] as int?,
      reserved: json['reserved'],
      status: json['status'] as String?,
      timestamp: json['timestamp'] == null
          ? null
          : DateTime.parse(json['timestamp'] as String),
      verify: json['verify'],
      workCode: json['work_code'],
    );

Map<String, dynamic> _$AttendanceRecordToJson(AttendanceRecord instance) =>
    <String, dynamic>{
      'id': instance.id,
      'reserved': instance.reserved,
      'status': instance.status,
      'timestamp': instance.timestamp?.toIso8601String(),
      'verify': instance.verify,
      'work_code': instance.workCode,
    };
