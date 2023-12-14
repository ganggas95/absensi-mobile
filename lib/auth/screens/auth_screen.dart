import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sitampan_mobile/auth/widgets/auth_form.dart';
import 'package:sitampan_mobile/providers/settings_providers.dart';
import 'package:sitampan_mobile/screens/authenticated_screen.dart';
import 'package:sitampan_mobile/widgets/global_background.dart';

class AuthScreen extends ConsumerStatefulWidget {
  const AuthScreen({super.key});

  @override
  ConsumerState<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends ConsumerState<AuthScreen> {
  void _goToDashboard() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx) {
        return const AuthenticatedScreen();
      }));
    });
  }

  @override
  void initState() {
    super.initState();

    bool isAuthenticated = ref.read(settingsProviders).isAuthenticated;
    if (isAuthenticated) {
      _goToDashboard();
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: GlobalBackgroundWidget(
      child: Center(
        child: SingleChildScrollView(
          child: AuthFormWidget(),
        ),
      ),
    ));
  }
}
