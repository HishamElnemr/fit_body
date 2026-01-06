import 'package:fb_fitbody/features/auth/domain/entities/user_entity.dart';

class AuthResponseEntity {
  final String message;
  final UserEntity? user;

  AuthResponseEntity({required this.message, this.user});

  factory AuthResponseEntity.fromJson(Map<String, dynamic> json) {
    return AuthResponseEntity(
      message: json['message'],
      user: json['user'] != null ? UserEntity.fromJson(json['user']) : null,
    );
  }
}
