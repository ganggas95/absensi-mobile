// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Group _$GroupFromJson(Map<String, dynamic> json) => Group(
      action: json['action'],
      code: json['code'] as String?,
      id: json['id'] as int?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$GroupToJson(Group instance) => <String, dynamic>{
      'action': instance.action,
      'code': instance.code,
      'id': instance.id,
      'name': instance.name,
    };
