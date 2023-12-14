import 'package:flutter/material.dart';
import 'package:sitampan_mobile/request_leave/screens/request_leave.dart';
import 'package:sitampan_mobile/dashboard/screens/dashboard.dart';
import 'package:sitampan_mobile/profile/screens/profile.dart';
import 'package:sitampan_mobile/report_attendance/screens/report_attendance.dart';
import 'package:sitampan_mobile/widgets/global_background.dart';

class AuthenticatedScreen extends StatefulWidget {
  const AuthenticatedScreen({super.key});

  @override
  State<AuthenticatedScreen> createState() => _AuthenticatedScreenState();
}

class _AuthenticatedScreenState extends State<AuthenticatedScreen> {
  int _selectedIndex = 0;
  void _onNavigationItemSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> pages = const [
      DashboardScreen(),
      RequestLeaveScreen(),
      ReportAttendanceScreen(),
      ProfileScreen(),
    ];
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _onNavigationItemSelected,
          selectedItemColor: Colors.blue,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.sticky_note_2), label: "Permintaan Izin"),
            BottomNavigationBarItem(
                icon: Icon(Icons.analytics), label: "Laporan"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
          ]),
      body: GlobalBackgroundWidget(child: pages[_selectedIndex]),
    );
  }
}
