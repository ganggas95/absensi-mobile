import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sitampan_mobile/auth/dto/auth_dto.dart';
import 'package:sitampan_mobile/auth/models/auth.dart';
import 'package:sitampan_mobile/auth/services/auth_service.dart';
import 'package:sitampan_mobile/mixins/base_response.dart';
import 'package:sitampan_mobile/providers/settings_providers.dart';

class AuthStateNotifier extends StateNotifier<AuthState> {
  final AuthService _authService = AuthService();
  final Ref ref;
  AuthStateNotifier({required this.ref})
      : super(AuthState(data: {
          AuthField.username: "",
          AuthField.password: "",
        }, errors: null));

  void setUsername(String username) {
    state = AuthState(data: {
      ...?state.data,
      AuthField.username: username,
    }, errors: null);
  }

  void setPassword(String password) {
    state = AuthState(data: {
      ...?state.data,
      AuthField.password: password,
    }, errors: null);
  }

  Future<bool> login() async {
    BaseResponse<AuthResponse?> response =
        await _authService.login(AuthDTO.fromJson(state.data!));
    if (response.data != null) {
      state = AuthState(
        data: {
          AuthField.username: "",
          AuthField.password: "",
        },
        errors: null,
      );
      ref
          .read(settingsProviders)
          .sharedPreferences
          .setString("token", response.data!.token!);
      ref
          .read(settingsProviders)
          .sharedPreferences
          .setString("user", response.data!.user!.toString());
      return true;
    } else if (response.errors != null) {
      state = AuthState(
        data: state.data,
        errors: "Username dan password salah",
      );
    }
    return false;
  }
}

final authProviders = StateNotifierProvider<AuthStateNotifier, AuthState>(
    (ref) => AuthStateNotifier(ref: ref));
