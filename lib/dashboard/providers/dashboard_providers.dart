import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sitampan_mobile/dashboard/models/dashboard.dart';
import 'package:sitampan_mobile/dashboard/services/dashboard_service.dart';

class DashboardStateNotifier extends StateNotifier<DashboardState> {
  final Ref ref;
  final DashboardService dashboardService = DashboardService();
  DashboardStateNotifier({required this.ref}) : super(DashboardState());
}

final dashboardProviders =
    StateNotifierProvider<DashboardStateNotifier, DashboardState>((ref) {
  return DashboardStateNotifier(ref: ref);
});
