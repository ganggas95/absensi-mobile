import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class DateTimeWidget extends ConsumerStatefulWidget {
  const DateTimeWidget({super.key});

  @override
  ConsumerState<DateTimeWidget> createState() => _DateTimeWidgetState();
}

class _DateTimeWidgetState extends ConsumerState<DateTimeWidget> {
  DateTime _currentTime = DateTime.now();

  late Timer timer;

  @override
  void initState() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _currentTime = DateTime.now();
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      textBaseline: TextBaseline.ideographic,
      children: [
        Text(DateFormat("HH:mm:ss").format(_currentTime),
            style: const TextStyle(fontSize: 24, color: Colors.white)),
        Text(DateFormat.yMMMMEEEEd().format(_currentTime),
            style: const TextStyle(fontSize: 14, color: Colors.white)),
      ],
    );
  }
}
