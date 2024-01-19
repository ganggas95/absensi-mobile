import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:sitampan_mobile/attendance/dto/attendance_dto.dart';
import 'package:sitampan_mobile/attendance/models/attendance.dart';
import 'package:sitampan_mobile/attendance/models/state.dart';
import 'package:sitampan_mobile/attendance/services/attendance_service.dart';
import 'package:sitampan_mobile/misc/sse.dart';
import 'package:sitampan_mobile/mixins/base_response.dart';
import 'package:sitampan_mobile/profile/models/user.dart';
import 'package:sitampan_mobile/providers/settings_providers.dart';

class AttendanceStateNotifier extends StateNotifier<AttendanceState> {
  final Ref ref;
  final AttendanceService attendanceService = AttendanceService();
  AttendanceStateNotifier({required this.ref}) : super(AttendanceState());

  Future sendAttendance(CreateAttendanceDTO payload) async {
    String? token = ref.read(settingsProviders).token;
    if (token == null) return;
    state = AttendanceState(isLoading: true, todayAtt: state.todayAtt);
    await attendanceService.sendAttendance(payload, token);
    state = AttendanceState(isLoading: false, todayAtt: state.todayAtt);
  }

  String? _buildIdStream() {
    User? user = ref.read(settingsProviders).user;
    if (user == null) return null;
    String now = DateFormat("y-MM-dd").format(DateTime.now());
    return "att-${user.username}-$now";
  }

  Future fetchAttendanceToday() async {
    String? token = ref.read(settingsProviders).token;
    if (token == null) return;

    // state = AttendanceState(isLoading: true, todayAtt: state.todayAtt);
    BaseResponse<AttendanceResponse?> response =
        await attendanceService.fetchTodayAttendance(token);
    // print(response.data);
    state = AttendanceState(isLoading: false, todayAtt: response.data);
  }

  void streamAttendanceToday() async {
    String? id = _buildIdStream();
    if (id == null) return;
    Stream stream =
        Sse.connect(channel: "attendance", id: id, type: "attendance").stream;
    stream.listen((event) {
      if (event != null) {
        state = AttendanceState(
            isLoading: false,
            todayAtt: AttendanceResponse.fromJson(jsonDecode(event)));
      }
    });
  }
}

final attendanceProviders =
    StateNotifierProvider<AttendanceStateNotifier, AttendanceState>((ref) {
  return AttendanceStateNotifier(ref: ref);
});
