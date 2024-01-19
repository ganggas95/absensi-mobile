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
  Widget buildAttendanceWidget(AttendanceRecord? att, String label) {
    const TextStyle textStyle = TextStyle(color: Colors.black, fontSize: 14);
    String timeAtt = '-';
    if (att != null && att.timestamp != null) {
      timeAtt = DateFormat("HH:mm:ss").format(att.timestamp!);
    }
    String status = "-";
    if (att != null && att.status != null) {
      status = att.status ?? "-";
    }
    return SizedBox(
      width: MediaQuery.of(context).size.width / 2.5,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(label, textAlign: TextAlign.center, style: textStyle),
            Text(timeAtt, textAlign: TextAlign.center, style: textStyle),
            Text(status, textAlign: TextAlign.center, style: textStyle),
          ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    final attendance = ref.watch(attendanceProviders).todayAtt;

    return Card(
      elevation: 10,
      color: Colors.white,
      clipBehavior: Clip.none,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
      child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Text("data")
              buildAttendanceWidget(attendance?.checkIn, 'Masuk'),
              // separator with grey
              Container(
                color: Colors.grey,
                width: 1,
                height: 50,
              ),
              buildAttendanceWidget(attendance?.checkOut, 'Keluar')
            ],
          )),
    );
  }
}
