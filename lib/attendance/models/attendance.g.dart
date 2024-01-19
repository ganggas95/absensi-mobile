// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attendance.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AttendanceResponse _$AttendanceResponseFromJson(Map<String, dynamic> json) =>
    AttendanceResponse(
      checkIn: json['check_in'] == null
          ? null
          : AttendanceRecord.fromJson(json['check_in'] as Map<String, dynamic>),
      checkInToleransi: json['check_in_toleransi'] as String?,
      checkOut: json['check_out'] == null
          ? null
          : AttendanceRecord.fromJson(
              json['check_out'] as Map<String, dynamic>),
      checkOutToleransi: json['check_out_toleransi'] as String?,
      countCp: (json['count_cp'] as num?)?.toDouble(),
      countLd: (json['count_ld'] as num?)?.toDouble(),
      countLdCp: (json['count_ld_cp'] as num?)?.toDouble(),
      cuti: json['cuti'] as int?,
      date: json['date'] as String?,
      employee: json['employee'] == null
          ? null
          : Employee.fromJson(json['employee'] as Map<String, dynamic>),
      hadir: json['hadir'] as int?,
      id: json['id'] as int?,
      isCp: json['is_cp'] as bool?,
      isLd: json['is_ld'] as bool?,
      isTk: json['is_tk'] as bool?,
      izin: json['izin'] as int?,
      jamKerja: (json['jam_kerja'] as num?)?.toDouble(),
      jamKurang: (json['jam_kurang'] as num?)?.toDouble(),
      jmlHariKerja: json['jml_hari_kerja'] as int?,
      manualAdd: json['manual_add'] as bool?,
      opd: json['opd'] == null
          ? null
          : Opd.fromJson(json['opd'] as Map<String, dynamic>),
      percentLdCp: (json['percent_ld_cp'] as num?)?.toDouble(),
      sakit: json['sakit'] as int?,
      status: json['status'] as String?,
      statusTemp: json['status_temp'],
      tBelajar: json['t_belajar'] as int?,
      tDinas: json['t_dinas'] as int?,
      tap: json['tap'] as int?,
      timeCp: json['time_cp'] as String?,
      timeLd: json['time_ld'],
      total: (json['total'] as num?)?.toDouble(),
      trash: json['trash'],
      unit: json['unit'] == null
          ? null
          : Unit.fromJson(json['unit'] as Map<String, dynamic>),
      verified: json['verified'] as bool?,
      verifiedAt: json['verified_at'],
      verifiedBy: json['verified_by'],
      verifiedStatus: json['verified_status'],
    );

Map<String, dynamic> _$AttendanceResponseToJson(AttendanceResponse instance) =>
    <String, dynamic>{
      'check_in': instance.checkIn,
      'check_in_toleransi': instance.checkInToleransi,
      'check_out': instance.checkOut,
      'check_out_toleransi': instance.checkOutToleransi,
      'count_cp': instance.countCp,
      'count_ld': instance.countLd,
      'count_ld_cp': instance.countLdCp,
      'cuti': instance.cuti,
      'date': instance.date,
      'employee': instance.employee,
      'hadir': instance.hadir,
      'id': instance.id,
      'is_cp': instance.isCp,
      'is_ld': instance.isLd,
      'is_tk': instance.isTk,
      'izin': instance.izin,
      'jam_kerja': instance.jamKerja,
      'jam_kurang': instance.jamKurang,
      'jml_hari_kerja': instance.jmlHariKerja,
      'manual_add': instance.manualAdd,
      'opd': instance.opd,
      'percent_ld_cp': instance.percentLdCp,
      'sakit': instance.sakit,
      'status': instance.status,
      'status_temp': instance.statusTemp,
      't_belajar': instance.tBelajar,
      't_dinas': instance.tDinas,
      'tap': instance.tap,
      'time_cp': instance.timeCp,
      'time_ld': instance.timeLd,
      'total': instance.total,
      'trash': instance.trash,
      'unit': instance.unit,
      'verified': instance.verified,
      'verified_at': instance.verifiedAt,
      'verified_by': instance.verifiedBy,
      'verified_status': instance.verifiedStatus,
    };
