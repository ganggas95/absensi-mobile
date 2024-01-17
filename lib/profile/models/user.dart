import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:sitampan_mobile/profile/models/group.dart';
import 'package:sitampan_mobile/profile/models/organizations/opd.dart';
import 'package:sitampan_mobile/profile/models/organizations/unit_kerja.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  // @JsonKey(name: 'access_kepang')
  final bool? accessKepang;
  // @JsonKey(name: 'access_senteg')
  final bool? accessSenteg;
  // @JsonKey(name: 'access_simpeg')
  final bool? accessSimpeg;
  // @JsonKey(name: 'active')
  final bool? active;
  // @JsonKey(name: 'created_at')
  final DateTime? createdAt;
  // @JsonKey(name: 'group')
  final Group? group;
  // @JsonKey(name: 'id')
  final int? id;
  // @JsonKey(name: 'is_admin_helper')
  final bool? isAdminHelper;
  // @JsonKey(name: 'is_admin_local')
  final bool? isAdminLocal;
  // @JsonKey(name: 'is_admin_opd')
  final bool? isAdminOpd;
  // @JsonKey(name: 'is_super_admin')
  final bool? isSuperAdmin;
  // @JsonKey(name: 'last_login')
  final DateTime? lastLogin;
  // @JsonKey(name: 'login_from')
  final dynamic loginFrom;
  // @JsonKey(name: 'opd')
  final Opd? opd;
  // @JsonKey(name: 'unit')
  final UnitKerja? unit;
  // @JsonKey(name: 'update')
  final bool? update;
  // @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;
  // @JsonKey(name: 'username')
  final String? username;

  const User({
    this.accessKepang,
    this.accessSenteg,
    this.accessSimpeg,
    this.active,
    this.createdAt,
    this.group,
    this.id,
    this.isAdminHelper,
    this.isAdminLocal,
    this.isAdminOpd,
    this.isSuperAdmin,
    this.lastLogin,
    this.loginFrom,
    this.opd,
    this.unit,
    this.update,
    this.updatedAt,
    this.username,
  });

  @override
  String toString() {
    // TODO: Before encoding json make sure the DateTime converted to string
    return json.encode(this);
  }

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);

  User copyWith({
    bool? accessKepang,
    bool? accessSenteg,
    bool? accessSimpeg,
    bool? active,
    DateTime? createdAt,
    Group? group,
    int? id,
    bool? isAdminHelper,
    bool? isAdminLocal,
    bool? isAdminOpd,
    bool? isSuperAdmin,
    DateTime? lastLogin,
    dynamic loginFrom,
    Opd? opd,
    dynamic unit,
    bool? update,
    DateTime? updatedAt,
    String? username,
  }) {
    return User(
      accessKepang: accessKepang ?? this.accessKepang,
      accessSenteg: accessSenteg ?? this.accessSenteg,
      accessSimpeg: accessSimpeg ?? this.accessSimpeg,
      active: active ?? this.active,
      createdAt: createdAt ?? this.createdAt,
      group: group ?? this.group,
      id: id ?? this.id,
      isAdminHelper: isAdminHelper ?? this.isAdminHelper,
      isAdminLocal: isAdminLocal ?? this.isAdminLocal,
      isAdminOpd: isAdminOpd ?? this.isAdminOpd,
      isSuperAdmin: isSuperAdmin ?? this.isSuperAdmin,
      lastLogin: lastLogin ?? this.lastLogin,
      loginFrom: loginFrom ?? this.loginFrom,
      opd: opd ?? this.opd,
      unit: unit ?? this.unit,
      update: update ?? this.update,
      updatedAt: updatedAt ?? this.updatedAt,
      username: username ?? this.username,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! User) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      accessKepang.hashCode ^
      accessSenteg.hashCode ^
      accessSimpeg.hashCode ^
      active.hashCode ^
      createdAt.hashCode ^
      group.hashCode ^
      id.hashCode ^
      isAdminHelper.hashCode ^
      isAdminLocal.hashCode ^
      isAdminOpd.hashCode ^
      isSuperAdmin.hashCode ^
      lastLogin.hashCode ^
      loginFrom.hashCode ^
      opd.hashCode ^
      unit.hashCode ^
      update.hashCode ^
      updatedAt.hashCode ^
      username.hashCode;
}
