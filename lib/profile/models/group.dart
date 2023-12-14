import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';

part 'group.g.dart';

@JsonSerializable()
class Group {
  final dynamic action;
  final String? code;
  final int? id;
  final String? name;

  const Group({this.action, this.code, this.id, this.name});

  @override
  String toString() {
    return json.encode(this);
  }

  factory Group.fromJson(Map<String, dynamic> json) => _$GroupFromJson(json);

  Map<String, dynamic> toJson() => _$GroupToJson(this);

  Group copyWith({
    dynamic action,
    String? code,
    int? id,
    String? name,
  }) {
    return Group(
      action: action ?? this.action,
      code: code ?? this.code,
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Group) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      action.hashCode ^ code.hashCode ^ id.hashCode ^ name.hashCode;
}
