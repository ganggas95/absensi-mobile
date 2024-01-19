import 'package:sitampan_mobile/attendance/dto/attendance_dto.dart';
import 'package:sitampan_mobile/attendance/models/attendance.dart';
import 'package:sitampan_mobile/mixins/base_response.dart';
import 'package:sitampan_mobile/mixins/service_mixin.dart';

class AttendanceService with ServiceMixin {
  Future sendAttendance(CreateAttendanceDTO payload, token) async {
    try {
      Map<String, String> headers = buildHeaders(token);
      final response = await post('/service/v1/attendance/employee/new',
          body: payload.toJson(), headers: headers);
      return BaseResponse<dynamic>.fromJson(response, (Object? r) {
        return r;
      });
    } catch (e) {
      rethrow;
    }
  }

  Future<BaseResponse<AttendanceResponse?>> fetchTodayAttendance(token) async {
    try {
      Map<String, String> headers = buildHeaders(token);
      final response =
          await get('/service/v1/attendance/my-attendance', headers: headers);
      return BaseResponse<AttendanceResponse?>.fromJson(response, (Object? r) {
        return r != null
            ? AttendanceResponse.fromJson(r as Map<String, dynamic>)
            : null;
      });
    } catch (e) {
      rethrow;
    }
  }
}
