import 'package:flutter/material.dart';
import 'package:random_avatar/random_avatar.dart';
import 'package:sitampan_mobile/profile/models/user.dart';

class ProfilePictureWidget extends StatelessWidget {
  final User user;
  const ProfilePictureWidget({required this.user, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RandomAvatar(user.username!,
            width: 100, height: 100, fit: BoxFit.cover),
        const SizedBox(
          height: 20,
        ),
        ElevatedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.edit),
            label: const Text("Ubah foto profil")),
      ],
    );
  }
}
