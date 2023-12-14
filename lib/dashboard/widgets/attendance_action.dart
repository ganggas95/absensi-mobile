import 'package:flutter/material.dart';

class AttendanceActionWidget extends StatefulWidget {
  const AttendanceActionWidget({super.key});

  @override
  State<AttendanceActionWidget> createState() => _AttendanceActionWidgetState();
}

class _AttendanceActionWidgetState extends State<AttendanceActionWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 28),
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.blueGrey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 1), // changes position of shadow
            ),
          ],
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          gradient: LinearGradient(colors: [
            Theme.of(context).primaryColor.withOpacity(0.8),
            Theme.of(context).primaryColor.withOpacity(0.9)
          ], begin: Alignment.topRight, end: Alignment.bottomLeft),
        ),
        child: const Column(
          children: [
            Icon(
              Icons.pan_tool_alt,
              size: 32,
              color: Colors.white,
            ),
            Text("Masuk",
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.white))
          ],
        ),
      ),
    );
  }
}
