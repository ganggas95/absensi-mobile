import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sitampan_mobile/profile/models/user.dart';
import 'package:sitampan_mobile/providers/settings_providers.dart';

class DashboardWelcomeWidget extends ConsumerStatefulWidget {
  const DashboardWelcomeWidget({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _DashboardWelcomeWidgetState();
}

class _DashboardWelcomeWidgetState
    extends ConsumerState<DashboardWelcomeWidget> {
  @override
  Widget build(BuildContext context) {
    final User? user = ref.watch(settingsProviders).user;
    return Column(
      children: [
        const Text("Selamat Datang",
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white)),
        user != null
            ? Text(user.username!, style: const TextStyle(color: Colors.white))
            : const SizedBox()
      ],
    );
  }
}
