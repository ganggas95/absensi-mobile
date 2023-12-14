import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sitampan_mobile/auth/providers/auth_providers.dart';
import 'package:sitampan_mobile/screens/authenticated_screen.dart';

class AuthFormWidget extends ConsumerStatefulWidget {
  const AuthFormWidget({super.key});

  @override
  ConsumerState<AuthFormWidget> createState() => _AuthFormWidgetState();
}

class _AuthFormWidgetState extends ConsumerState<AuthFormWidget> {
  final _formKey = GlobalKey<FormState>();

  void _goToDashboard() {
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx) {
      return const AuthenticatedScreen();
    }));
  }

  void _submit() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      bool isSuccess = await ref.read(authProviders.notifier).login();
      if (isSuccess) {
        _goToDashboard();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authProviders);
    return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Image(
            image: AssetImage('images/logo_bima.png'),
            width: double.infinity,
            height: 80,
          ),
          Card(
            clipBehavior: Clip.hardEdge,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            color: Colors.white,
            elevation: 1,
            shadowColor: Colors.white,
            margin: const EdgeInsets.all(20),
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Form(
                  key: _formKey,
                  child: Column(children: [
                    Text(
                      "Silahkan Login",
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium!
                          .copyWith(
                              color: Theme.of(context).colorScheme.onBackground,
                              fontWeight: FontWeight.w900),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    TextFormField(
                      style: const TextStyle(fontSize: 14),
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.person),
                        label: Text("Username"),
                      ),
                      onSaved: (value) {
                        ref.read(authProviders.notifier).setUsername(value!);
                      },
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      keyboardType: TextInputType.visiblePassword,
                      style: const TextStyle(fontSize: 14),
                      obscureText: true,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.lock),
                        labelText: "Password",
                      ),
                      onSaved: (value) {
                        ref.read(authProviders.notifier).setPassword(value!);
                      },
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        _submit();
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Theme.of(context).primaryColor,
                          elevation: 1,
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          minimumSize: const Size(double.infinity, 0)),
                      child: const Text(
                        "Login",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                    authState.errors != null
                        ? Container(
                            alignment: Alignment.center,
                            padding: const EdgeInsets.all(8),
                            margin: const EdgeInsets.only(top: 20),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border(
                                    bottom: BorderSide(
                                        color:
                                            Colors.redAccent.withOpacity(0.4)),
                                    top: BorderSide(
                                        color:
                                            Colors.redAccent.withOpacity(0.4)),
                                    left: BorderSide(
                                        color:
                                            Colors.redAccent.withOpacity(0.4)),
                                    right: BorderSide(
                                        color: Colors.redAccent
                                            .withOpacity(0.4)))),
                            child: Text(
                              authState.errors!,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                  color: Colors.redAccent.withOpacity(0.8)),
                            ))
                        : const SizedBox(),
                  ])),
            ),
          )
        ]);
  }
}
