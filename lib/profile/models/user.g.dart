// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      accessKepang: json['accessKepang'] as bool?,
      accessSenteg: json['accessSenteg'] as bool?,
      accessSimpeg: json['accessSimpeg'] as bool?,
      active: json['active'] as bool?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      group: json['group'] == null
          ? null
          : Group.fromJson(json['group'] as Map<String, dynamic>),
      id: json['id'] as int?,
      isAdminHelper: json['isAdminHelper'] as bool?,
      isAdminLocal: json['isAdminLocal'] as bool?,
      isAdminOpd: json['isAdminOpd'] as bool?,
      isSuperAdmin: json['isSuperAdmin'] as bool?,
      lastLogin: json['lastLogin'] == null
          ? null
          : DateTime.parse(json['lastLogin'] as String),
      loginFrom: json['loginFrom'],
      opd: json['opd'] == null
          ? null
          : Opd.fromJson(json['opd'] as Map<String, dynamic>),
      unit: json['unit'] == null
          ? null
          : UnitKerja.fromJson(json['unit'] as Map<String, dynamic>),
      update: json['update'] as bool?,
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      username: json['username'] as String?,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'accessKepang': instance.accessKepang,
      'accessSenteg': instance.accessSenteg,
      'accessSimpeg': instance.accessSimpeg,
      'active': instance.active,
      'createdAt': instance.createdAt?.toIso8601String(),
      'group': instance.group,
      'id': instance.id,
      'isAdminHelper': instance.isAdminHelper,
      'isAdminLocal': instance.isAdminLocal,
      'isAdminOpd': instance.isAdminOpd,
      'isSuperAdmin': instance.isSuperAdmin,
      'lastLogin': instance.lastLogin?.toIso8601String(),
      'loginFrom': instance.loginFrom,
      'opd': instance.opd,
      'unit': instance.unit,
      'update': instance.update,
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'username': instance.username,
    };
