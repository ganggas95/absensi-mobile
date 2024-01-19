import 'package:flutter/material.dart';

class GlobalBackgroundWidget extends StatelessWidget {
  final Widget child;
  const GlobalBackgroundWidget({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const Image(
          image: AssetImage("images/background.webp"),
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
        ),
        Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                // Colors.black38,
                // Colors.black54,

                Colors.black38,
                Colors.black54,
              ],
                  stops: [
                0,
                1
              ])),
        ),
        child,
      ],
    );
  }
}
