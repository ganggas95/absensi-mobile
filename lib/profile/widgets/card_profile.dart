import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:sitampan_mobile/providers/settings_providers.dart';

class CardProfileWidget extends ConsumerStatefulWidget {
  const CardProfileWidget({super.key});

  @override
  ConsumerState<CardProfileWidget> createState() => _CardProfileWidgetState();
}

class _CardProfileWidgetState extends ConsumerState<CardProfileWidget> {
  @override
  Widget build(BuildContext context) {
    final user = ref.watch(settingsProviders).user;
    String lastLogin = '';
    if (user != null) {
      lastLogin =
          timeago.format(user.lastLogin!, allowFromNow: true, locale: 'id');
    }

    return Card(
      child: Column(children: [
        ListTile(
          leading: const Icon(Icons.person),
          title: Text(
            user!.username!,
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
            "Username",
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
                color: Theme.of(context)
                    .colorScheme
                    .onBackground
                    .withOpacity(0.7)),
          ),
          trailing: IconButton(
              icon: const Icon(
                Icons.edit_outlined,
                size: 20,
              ),
              onPressed: () {}),
        ),
        ListTile(
          leading: const Icon(Icons.key),
          title: Text(
            "*" * 10,
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
            "Password",
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
                color: Theme.of(context)
                    .colorScheme
                    .onBackground
                    .withOpacity(0.7)),
          ),
          trailing: IconButton(
              icon: const Icon(
                Icons.edit_outlined,
                size: 20,
              ),
              onPressed: () {}),
        ),
        ListTile(
          leading: const Icon(Icons.diversity_3),
          title: Text(
            user.group!.name!,
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
            "User Group",
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
                color: Theme.of(context)
                    .colorScheme
                    .onBackground
                    .withOpacity(0.7)),
          ),
        ),
        ListTile(
          leading: const Icon(Icons.timelapse),
          title: Text(
            lastLogin,
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
            "Last Login",
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
                color: Theme.of(context)
                    .colorScheme
                    .onBackground
                    .withOpacity(0.7)),
          ),
        ),
      ]),
    );
  }
}
