import 'package:fb_fitbody/features/auth/data/models/user_model.dart';
import 'package:fb_fitbody/features/auth/domain/entities/auth_response_entity.dart';

class AuthResponse {
  final String message;
  final UserModel? user;

  AuthResponse({required this.message, this.user});

  factory AuthResponse.fromJson(Map<String, dynamic> json) {
    return AuthResponse(
      message: json['message'],
      user: json['user'] != null ? UserModel.fromJson(json['user']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {'message': message, 'user': user?.toJson()};
  }

  toEntity() {
    return AuthResponseEntity(message: message, user: user?.toEntity());
  }
}
