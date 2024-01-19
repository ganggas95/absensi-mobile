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
        }, errors: null, loading: false));

  void setUsername(String username) {
    state = AuthState(data: {
      ...?state.data,
      AuthField.username: username,
    }, errors: null, loading: false);
  }

  void setPassword(String password) {
    state = AuthState(data: {
      ...?state.data,
      AuthField.password: password,
    }, errors: null, loading: false);
  }

  Future<bool> login() async {
    state = AuthState(data: state.data, errors: state.errors, loading: true);
    BaseResponse<AuthResponse?> response =
        await _authService.login(AuthDTO.fromJson(state.data!));
    // Simulate time sleep
    // await Future.delayed(const Duration(seconds: 5));
    if (response.data != null) {
      if (response.data!.user!.isUserRegular!) {
        ref
            .read(settingsProviders)
            .sharedPreferences
            .setString("token", response.data!.token!);

        ref
            .read(settingsProviders)
            .sharedPreferences
            .setString("user", response.data!.user!.toString());

        state = AuthState(data: {
          AuthField.username: "",
          AuthField.password: "",
        }, errors: null, loading: false);
        return true;
      }

      state = AuthState(
          data: state.data,
          errors: "Aplikasi ini hanya boleh digunakan oleh pegawai!",
          loading: false);
    } else if (response.errors != null) {
      state = AuthState(
          data: state.data,
          errors: "Username dan password salah",
          loading: false);
    }
    return false;
  }
}

final authProviders = StateNotifierProvider<AuthStateNotifier, AuthState>(
    (ref) => AuthStateNotifier(ref: ref));
