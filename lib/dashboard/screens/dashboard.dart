import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sitampan_mobile/dashboard/widgets/attendance_action.dart';
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
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 48, bottom: 40),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Column(
                children: [
                  DashboardWelcomeWidget(),
                  DateTimeWidget(),
                  SizedBox(
                    height: 20,
                  ),
                  AttendanceActionWidget(),
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              const Text(
                "Atau",
                style: TextStyle(color: Colors.white70, fontSize: 16),
              ),
              const SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton.icon(
                      label: const Text(
                        "Ajukan Izin",
                        style: TextStyle(color: Colors.black),
                      ),
                      icon: const Icon(
                        Icons.back_hand,
                        color: Colors.black,
                      ),
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            Theme.of(context).colorScheme.background,
                      )),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const MapPositionWidget(),
            ]),
      ),
    ));
  }
}
