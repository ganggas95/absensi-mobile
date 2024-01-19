import 'package:json_annotation/json_annotation.dart';
import 'package:sitampan_mobile/profile/models/user.dart';

part 'auth.g.dart';

enum AuthField { username, password }

class AuthState {
  final Map<AuthField, String>? data;
  final String? errors;
  final bool loading;
  AuthState({required this.data, this.errors, this.loading = false});
}

@JsonSerializable()
class AuthResponse {
  @JsonKey(name: "token")
  final String? token;

  @JsonKey(name: "user")
  final User? user;

  const AuthResponse({this.token, this.user});

  factory AuthResponse.fromJson(Map<String, dynamic> json) =>
      _$AuthResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AuthResponseToJson(this);

  AuthResponse copyWith({
    String? token,
    User? user,
  }) {
    return AuthResponse(
      token: token ?? this.token,
      user: user ?? this.user,
    );
  }
}
