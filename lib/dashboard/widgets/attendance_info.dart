import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:sitampan_mobile/attendance/models/att_record.dart';
import 'package:sitampan_mobile/attendance/providers/attendance_providers.dart';

class AttendanceInfoWidget extends ConsumerStatefulWidget {
  const AttendanceInfoWidget({super.key});

  @override
  ConsumerState<AttendanceInfoWidget> createState() =>
      _AttendanceInfoWidgetState();
}

class _AttendanceInfoWidgetState extends ConsumerState<AttendanceInfoWidget> {
  Widget buildAttendanceWidget(AttendanceRecord att, String label) {
    const TextStyle textStyle = TextStyle(color: Colors.white, fontSize: 14);
    return Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(label, style: textStyle),
          Text(
            att.timestamp != null
                ? DateFormat("HH:mm:ss").format(att.timestamp!)
                : "-",
            style: textStyle,
          )
        ]);
  }

  @override
  Widget build(BuildContext context) {
    final attendance = ref.watch(attendanceProviders).todayAtt;
    Widget? attCheckin;
    Widget? attCheckout;
    if (attendance != null && attendance.checkIn != null) {
      attCheckin = buildAttendanceWidget(attendance.checkIn!, 'Masuk:');
    }
    if (attendance != null && attendance.checkOut != null) {
      attCheckout = buildAttendanceWidget(attendance.checkOut!, 'Keluar:');
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      textBaseline: TextBaseline.ideographic,
      children: [
        attCheckin ?? const SizedBox(),
        attCheckout ?? const SizedBox(),
      ],
    );
  }
}
