import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';

import 'att_record.dart';
import 'employee.dart';
import 'opd.dart';
import 'unit.dart';

part 'attendance.g.dart';

@JsonSerializable()
class AttendanceResponse {
  @JsonKey(name: 'check_in')
  final AttendanceRecord? checkIn;
  @JsonKey(name: 'check_in_toleransi')
  final String? checkInToleransi;
  @JsonKey(name: 'check_out')
  final AttendanceRecord? checkOut;
  @JsonKey(name: 'check_out_toleransi')
  final String? checkOutToleransi;
  @JsonKey(name: 'count_cp')
  final double? countCp;
  @JsonKey(name: 'count_ld')
  final double? countLd;
  @JsonKey(name: 'count_ld_cp')
  final double? countLdCp;
  final int? cuti;
  final String? date;
  final Employee? employee;
  final int? hadir;
  final int? id;
  @JsonKey(name: 'is_cp')
  final bool? isCp;
  @JsonKey(name: 'is_ld')
  final bool? isLd;
  @JsonKey(name: 'is_tk')
  final bool? isTk;
  final int? izin;
  @JsonKey(name: 'jam_kerja')
  final double? jamKerja;
  @JsonKey(name: 'jam_kurang')
  final double? jamKurang;
  @JsonKey(name: 'jml_hari_kerja')
  final int? jmlHariKerja;
  @JsonKey(name: 'manual_add')
  final bool? manualAdd;
  final Opd? opd;
  @JsonKey(name: 'percent_ld_cp')
  final double? percentLdCp;
  final int? sakit;
  final String? status;
  @JsonKey(name: 'status_temp')
  final dynamic statusTemp;
  @JsonKey(name: 't_belajar')
  final int? tBelajar;
  @JsonKey(name: 't_dinas')
  final int? tDinas;
  final int? tap;
  @JsonKey(name: 'time_cp')
  final String? timeCp;
  @JsonKey(name: 'time_ld')
  final dynamic timeLd;
  final double? total;
  final dynamic trash;
  final Unit? unit;
  final bool? verified;
  @JsonKey(name: 'verified_at')
  final dynamic verifiedAt;
  @JsonKey(name: 'verified_by')
  final dynamic verifiedBy;
  @JsonKey(name: 'verified_status')
  final dynamic verifiedStatus;

  const AttendanceResponse({
    this.checkIn,
    this.checkInToleransi,
    this.checkOut,
    this.checkOutToleransi,
    this.countCp,
    this.countLd,
    this.countLdCp,
    this.cuti,
    this.date,
    this.employee,
    this.hadir,
    this.id,
    this.isCp,
    this.isLd,
    this.isTk,
    this.izin,
    this.jamKerja,
    this.jamKurang,
    this.jmlHariKerja,
    this.manualAdd,
    this.opd,
    this.percentLdCp,
    this.sakit,
    this.status,
    this.statusTemp,
    this.tBelajar,
    this.tDinas,
    this.tap,
    this.timeCp,
    this.timeLd,
    this.total,
    this.trash,
    this.unit,
    this.verified,
    this.verifiedAt,
    this.verifiedBy,
    this.verifiedStatus,
  });

  @override
  String toString() {
    return 'Attendance(checkIn: $checkIn, checkInToleransi: $checkInToleransi, checkOut: $checkOut, checkOutToleransi: $checkOutToleransi, countCp: $countCp, countLd: $countLd, countLdCp: $countLdCp, cuti: $cuti, date: $date, employee: $employee, hadir: $hadir, id: $id, isCp: $isCp, isLd: $isLd, isTk: $isTk, izin: $izin, jamKerja: $jamKerja, jamKurang: $jamKurang, jmlHariKerja: $jmlHariKerja, manualAdd: $manualAdd, opd: $opd, percentLdCp: $percentLdCp, sakit: $sakit, status: $status, statusTemp: $statusTemp, tBelajar: $tBelajar, tDinas: $tDinas, tap: $tap, timeCp: $timeCp, timeLd: $timeLd, total: $total, trash: $trash, unit: $unit, verified: $verified, verifiedAt: $verifiedAt, verifiedBy: $verifiedBy, verifiedStatus: $verifiedStatus)';
  }

  factory AttendanceResponse.fromJson(Map<String, dynamic> json) {
    return _$AttendanceResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$AttendanceResponseToJson(this);

  AttendanceResponse copyWith({
    AttendanceRecord? checkIn,
    String? checkInToleransi,
    AttendanceRecord? checkOut,
    String? checkOutToleransi,
    double? countCp,
    double? countLd,
    double? countLdCp,
    int? cuti,
    String? date,
    Employee? employee,
    int? hadir,
    int? id,
    bool? isCp,
    bool? isLd,
    bool? isTk,
    int? izin,
    double? jamKerja,
    double? jamKurang,
    int? jmlHariKerja,
    bool? manualAdd,
    Opd? opd,
    double? percentLdCp,
    int? sakit,
    String? status,
    dynamic statusTemp,
    int? tBelajar,
    int? tDinas,
    int? tap,
    String? timeCp,
    dynamic timeLd,
    double? total,
    dynamic trash,
    Unit? unit,
    bool? verified,
    dynamic verifiedAt,
    dynamic verifiedBy,
    dynamic verifiedStatus,
  }) {
    return AttendanceResponse(
      checkIn: checkIn ?? this.checkIn,
      checkInToleransi: checkInToleransi ?? this.checkInToleransi,
      checkOut: checkOut ?? this.checkOut,
      checkOutToleransi: checkOutToleransi ?? this.checkOutToleransi,
      countCp: countCp ?? this.countCp,
      countLd: countLd ?? this.countLd,
      countLdCp: countLdCp ?? this.countLdCp,
      cuti: cuti ?? this.cuti,
      date: date ?? this.date,
      employee: employee ?? this.employee,
      hadir: hadir ?? this.hadir,
      id: id ?? this.id,
      isCp: isCp ?? this.isCp,
      isLd: isLd ?? this.isLd,
      isTk: isTk ?? this.isTk,
      izin: izin ?? this.izin,
      jamKerja: jamKerja ?? this.jamKerja,
      jamKurang: jamKurang ?? this.jamKurang,
      jmlHariKerja: jmlHariKerja ?? this.jmlHariKerja,
      manualAdd: manualAdd ?? this.manualAdd,
      opd: opd ?? this.opd,
      percentLdCp: percentLdCp ?? this.percentLdCp,
      sakit: sakit ?? this.sakit,
      status: status ?? this.status,
      statusTemp: statusTemp ?? this.statusTemp,
      tBelajar: tBelajar ?? this.tBelajar,
      tDinas: tDinas ?? this.tDinas,
      tap: tap ?? this.tap,
      timeCp: timeCp ?? this.timeCp,
      timeLd: timeLd ?? this.timeLd,
      total: total ?? this.total,
      trash: trash ?? this.trash,
      unit: unit ?? this.unit,
      verified: verified ?? this.verified,
      verifiedAt: verifiedAt ?? this.verifiedAt,
      verifiedBy: verifiedBy ?? this.verifiedBy,
      verifiedStatus: verifiedStatus ?? this.verifiedStatus,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! AttendanceResponse) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      checkIn.hashCode ^
      checkInToleransi.hashCode ^
      checkOut.hashCode ^
      checkOutToleransi.hashCode ^
      countCp.hashCode ^
      countLd.hashCode ^
      countLdCp.hashCode ^
      cuti.hashCode ^
      date.hashCode ^
      employee.hashCode ^
      hadir.hashCode ^
      id.hashCode ^
      isCp.hashCode ^
      isLd.hashCode ^
      isTk.hashCode ^
      izin.hashCode ^
      jamKerja.hashCode ^
      jamKurang.hashCode ^
      jmlHariKerja.hashCode ^
      manualAdd.hashCode ^
      opd.hashCode ^
      percentLdCp.hashCode ^
      sakit.hashCode ^
      status.hashCode ^
      statusTemp.hashCode ^
      tBelajar.hashCode ^
      tDinas.hashCode ^
      tap.hashCode ^
      timeCp.hashCode ^
      timeLd.hashCode ^
      total.hashCode ^
      trash.hashCode ^
      unit.hashCode ^
      verified.hashCode ^
      verifiedAt.hashCode ^
      verifiedBy.hashCode ^
      verifiedStatus.hashCode;
}
