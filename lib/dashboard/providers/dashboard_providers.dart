import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sitampan_mobile/dashboard/dto/attendance_dto.dart';
import 'package:sitampan_mobile/dashboard/models/attendance.dart';
import 'package:sitampan_mobile/dashboard/services/dashboard_service.dart';
import 'package:sitampan_mobile/mixins/base_response.dart';
import 'package:sitampan_mobile/providers/settings_providers.dart';

class DashboardStateNotifier extends StateNotifier<DashboardState> {
  final Ref ref;
  final DashboardService dashboardService = DashboardService();
  DashboardStateNotifier({required this.ref}) : super(DashboardState());

  Future sendAttendance(CreateAttendanceDTO payload) async {
    String? token = ref.read(settingsProviders).token;
    print(token);
    if (token == null) return;
    state = DashboardState(isLoading: true);
    final BaseResponse<dynamic> response =
        await dashboardService.sendAttendance(payload, token);
    print(response.msg);
    state = DashboardState(isLoading: false);
  }
}

final dashboardProviders =
    StateNotifierProvider<DashboardStateNotifier, DashboardState>((ref) {
  return DashboardStateNotifier(ref: ref);
});
