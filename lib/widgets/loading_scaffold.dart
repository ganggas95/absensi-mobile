import 'package:flutter/material.dart';
import 'package:sitampan_mobile/widgets/loading_indicators.dart';

class LoadingScaffold extends StatelessWidget {
  const LoadingScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.center,
            child: const LoadingIndicators(
              width: 40,
              height: 40,
              strokeWidth: 4,
            ),
          )
        ],
      ),
    );
  }
}
