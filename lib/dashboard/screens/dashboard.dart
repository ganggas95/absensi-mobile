import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sitampan_mobile/attendance/providers/attendance_providers.dart';
import 'package:sitampan_mobile/dashboard/widgets/attendance_action.dart';
import 'package:sitampan_mobile/dashboard/widgets/attendance_info.dart';
import 'package:sitampan_mobile/dashboard/widgets/dashboard_welcome.dart';
import 'package:sitampan_mobile/dashboard/widgets/datetime_widget.dart';
import 'package:sitampan_mobile/dashboard/widgets/map_position.dart';

class DashboardScreen extends ConsumerStatefulWidget {
  const DashboardScreen({super.key});

  @override
  ConsumerState<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends ConsumerState<DashboardScreen> {
  @override
  void initState() {
    super.initState();

    final attendanceProvider = ref.read(attendanceProviders.notifier);
    _streamAttendance(attendanceProvider);
    _fetchTodayAtt(attendanceProvider);
  }

  void _streamAttendance(AttendanceStateNotifier provider) {
    provider.streamAttendanceToday();
  }

  void _fetchTodayAtt(AttendanceStateNotifier provider) async {
    await provider.fetchAttendanceToday();
  }

  @override
  Widget build(BuildContext context) {
    final loading = ref.read(attendanceProviders).isLoading;
    if (loading != null && loading) {
      return Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              child: const Text(
                "Loading...!",
                textAlign: TextAlign.justify,
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      );
    }
    return const Scaffold(
        body: SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(top: 48, bottom: 40),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: [
                  DashboardWelcomeWidget(),
                  DateTimeWidget(),
                  SizedBox(
                    height: 20,
                  ),
                  AttendanceInfoWidget(),
                  SizedBox(
                    height: 20,
                  ),
                  AttendanceActionWidget(),
                ],
              ),
              SizedBox(
                height: 40,
              ),
              // const Text(
              //   "Atau",
              //   style: TextStyle(color: Colors.white70, fontSize: 16),
              // ),
              // const SizedBox(
              //   height: 40,
              // ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     ElevatedButton.icon(
              //         label: const Text(
              //           "Ajukan Izin",
              //           style: TextStyle(color: Colors.black),
              //         ),
              //         icon: const Icon(
              //           Icons.back_hand,
              //           color: Colors.black,
              //         ),
              //         onPressed: () {},
              //         style: ElevatedButton.styleFrom(
              //           backgroundColor:
              //               Theme.of(context).colorScheme.background,
              //         )),
              //   ],
              // ),
              // const SizedBox(
              //   height: 20,
              // ),
              MapPositionWidget(),
            ]),
      ),
    ));
  }
}
