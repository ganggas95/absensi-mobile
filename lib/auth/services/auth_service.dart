import 'package:sitampan_mobile/auth/dto/auth_dto.dart';
import 'package:sitampan_mobile/auth/models/auth.dart';
import 'package:sitampan_mobile/mixins/base_response.dart';
import 'package:sitampan_mobile/mixins/service_mixin.dart';

class AuthService with ServiceMixin {
  Future<BaseResponse<AuthResponse?>> login(AuthDTO payload) async {
    try {
      final response = await post(
        '/service/v1/auth',
        body: payload.toJson(),
      );
      return BaseResponse<AuthResponse?>.fromJson(response, (Object? r) {
        return r != null
            ? AuthResponse.fromJson(r as Map<String, dynamic>)
            : null;
      });
    } catch (e) {
      rethrow;
    }
  }
}
