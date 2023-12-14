import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sitampan_mobile/auth/screens/auth_screen.dart';
import 'package:sitampan_mobile/profile/widgets/card_profile.dart';
import 'package:sitampan_mobile/profile/widgets/profile_picture.dart';
import 'package:sitampan_mobile/providers/settings_providers.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(settingsProviders).user;
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.8),
      body: SingleChildScrollView(
          child: Padding(
        padding:
            const EdgeInsets.only(top: 80, bottom: 40, left: 20, right: 20),
        child: Container(
          alignment: Alignment.center,
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            user != null ? ProfilePictureWidget(user: user) : const SizedBox(),
            const SizedBox(
              height: 20,
            ),
            const CardProfileWidget(),
            const SizedBox(
              height: 56,
            ),
            ElevatedButton.icon(
                style: Theme.of(context).elevatedButtonTheme.style!.copyWith(
                    backgroundColor: MaterialStateProperty.resolveWith(
                        (states) => Colors.orangeAccent),
                    padding: MaterialStateProperty.resolveWith((states) =>
                        const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 0)),
                    minimumSize: MaterialStateProperty.resolveWith(
                        (states) => const Size(double.infinity, 0))),
                onPressed: () {
                  showLogoutDialog(context, ref);
                },
                icon: const Icon(Icons.logout),
                label: const Text("Logout"))
          ]),
        ),
      )),
    );
  }

  void showLogoutDialog(BuildContext context, WidgetRef ref) {
    Widget okButton = TextButton(
      onPressed: () {
        ref.read(settingsProviders).logout().then((value) {
          ScaffoldMessenger.of(context).clearSnackBars();
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text("Logout Berhasil"),
          ));
          Navigator.of(context)
              .pushReplacement(MaterialPageRoute(builder: (ctx) {
            return const AuthScreen();
          }));
        });
      },
      child: const Text("Logout", style: TextStyle(color: Colors.redAccent)),
    );
    Widget cancelButton = TextButton(
      child: const Text("Batal"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      content: const Text("Anda yakin ingin keluar?"),
      actions: [
        cancelButton,
        okButton,
      ],
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
