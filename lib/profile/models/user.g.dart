// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      accessKepang: json['access_kepang'] as bool?,
      accessSenteg: json['access_senteg'] as bool?,
      accessSimpeg: json['access_simpeg'] as bool?,
      active: json['active'] as bool?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      group: json['group'] == null
          ? null
          : Group.fromJson(json['group'] as Map<String, dynamic>),
      id: json['id'] as int?,
      isAdminHelper: json['is_admin_helper'] as bool?,
      isAdminLocal: json['is_admin_local'] as bool?,
      isAdminOpd: json['is_admin_opd'] as bool?,
      isSuperAdmin: json['is_super_admin'] as bool?,
      lastLogin: json['last_login'] == null
          ? null
          : DateTime.parse(json['last_login'] as String),
      loginFrom: json['login_from'],
      opd: json['opd'] == null
          ? null
          : Opd.fromJson(json['opd'] as Map<String, dynamic>),
      unit: json['unit'] == null
          ? null
          : UnitKerja.fromJson(json['unit'] as Map<String, dynamic>),
      update: json['update'] as bool?,
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      username: json['username'] as String?,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'access_kepang': instance.accessKepang,
      'access_senteg': instance.accessSenteg,
      'access_simpeg': instance.accessSimpeg,
      'active': instance.active,
      'created_at': instance.createdAt?.toIso8601String(),
      'group': instance.group,
      'id': instance.id,
      'is_admin_helper': instance.isAdminHelper,
      'is_admin_local': instance.isAdminLocal,
      'is_admin_opd': instance.isAdminOpd,
      'is_super_admin': instance.isSuperAdmin,
      'last_login': instance.lastLogin?.toIso8601String(),
      'login_from': instance.loginFrom,
      'opd': instance.opd,
      'unit': instance.unit,
      'update': instance.update,
      'updated_at': instance.updatedAt?.toIso8601String(),
      'username': instance.username,
    };
