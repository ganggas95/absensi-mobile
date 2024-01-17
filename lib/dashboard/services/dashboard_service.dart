import 'package:sitampan_mobile/dashboard/dto/attendance_dto.dart';
import 'package:sitampan_mobile/mixins/base_response.dart';
import 'package:sitampan_mobile/mixins/service_mixin.dart';

class DashboardService with ServiceMixin {
  Future sendAttendance(CreateAttendanceDTO payload, token) async {
    try {
      Map<String, String> headers = buildHeaders(token);
      final response = await post(
          '/service/v1/attendance/employee/new', payload.toJson(), headers);
      return BaseResponse<dynamic>.fromJson(response, (Object? r) {
        return r;
      });
    } catch (e) {
      rethrow;
    }
  }
}
