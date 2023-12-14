import 'package:sitampan_mobile/auth/models/auth.dart';

class AuthDTO {
  final String username;
  final String password;
  const AuthDTO({required this.username, required this.password});

  factory AuthDTO.fromJson(Map<AuthField, dynamic> json) {
    return AuthDTO(
      username: json[AuthField.username],
      password: json[AuthField.password],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'password': password,
    };
  }
}
