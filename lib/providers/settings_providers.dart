import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sitampan_mobile/profile/models/user.dart';
import 'package:sitampan_mobile/providers/shared_preferences_providers.dart';

class SettingsRepository {
  final SharedPreferences sharedPreferences;
  SettingsRepository({required this.sharedPreferences});

  User? get user {
    Map<String, dynamic>? userJson =
        json.decode(sharedPreferences.getString("user")!);
    if (userJson != null) {
      return User.fromJson(userJson);
    }
    return null;
  }

  String? get token => sharedPreferences.getString("token");

  bool get isAuthenticated => token != null;

  Future<void> logout() async {
    await sharedPreferences.remove("token");
    await sharedPreferences.remove("user");
  }
}

final settingsProviders = Provider<SettingsRepository>((ref) {
  final sharedPreferences = ref.watch(sharedPreferencesProvider);
  return SettingsRepository(sharedPreferences: sharedPreferences);
});
