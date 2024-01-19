import 'package:flutter/material.dart';

class LoadingIndicators extends StatelessWidget {
  final double width;
  final double height;
  final double strokeWidth;
  const LoadingIndicators(
      {super.key,
      required this.width,
      required this.height,
      this.strokeWidth = 1});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: CircularProgressIndicator.adaptive(
        backgroundColor: Colors.white,
        strokeWidth: strokeWidth,
      ),
    );
  }
}
