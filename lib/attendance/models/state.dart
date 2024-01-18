import 'package:sitampan_mobile/attendance/models/attendance.dart';

class AttendanceState {
  final bool? isLoading;
  final AttendanceResponse? todayAtt;
  AttendanceState({this.isLoading, this.todayAtt});
}
