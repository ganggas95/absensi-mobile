import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';

part 'att_record.g.dart';

@JsonSerializable()
class AttendanceRecord {
  final int? id;
  final dynamic reserved;
  final String? status;
  final DateTime? timestamp;
  final dynamic verify;
  @JsonKey(name: 'work_code')
  final dynamic workCode;

  const AttendanceRecord({
    this.id,
    this.reserved,
    this.status,
    this.timestamp,
    this.verify,
    this.workCode,
  });

  @override
  String toString() {
    return 'CheckIn(id: $id, reserved: $reserved, status: $status, timestamp: $timestamp, verify: $verify, workCode: $workCode)';
  }

  factory AttendanceRecord.fromJson(Map<String, dynamic> json) {
    return _$AttendanceRecordFromJson(json);
  }

  Map<String, dynamic> toJson() => _$AttendanceRecordToJson(this);

  AttendanceRecord copyWith({
    int? id,
    dynamic reserved,
    String? status,
    DateTime? timestamp,
    dynamic verify,
    dynamic workCode,
  }) {
    return AttendanceRecord(
      id: id ?? this.id,
      reserved: reserved ?? this.reserved,
      status: status ?? this.status,
      timestamp: timestamp ?? this.timestamp,
      verify: verify ?? this.verify,
      workCode: workCode ?? this.workCode,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! AttendanceRecord) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      id.hashCode ^
      reserved.hashCode ^
      status.hashCode ^
      timestamp.hashCode ^
      verify.hashCode ^
      workCode.hashCode;
}
