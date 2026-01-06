import 'dart:developer';

import 'package:fb_fitbody/core/errors/auth_errors.dart';
import 'package:fb_fitbody/core/services/auth_services.dart';
import 'package:fb_fitbody/features/auth/data/models/login_request_body.dart';
import 'package:fb_fitbody/features/auth/data/models/signup_request_body.dart';
import 'package:fb_fitbody/features/auth/domain/entities/auth_response_entity.dart';
import 'package:fb_fitbody/features/auth/domain/repositories/auth_repo.dart';

class AuthRepoImplementation implements AuthRepo {
  final AuthServices authServices;
  AuthRepoImplementation({required this.authServices});
  @override
  Future<AuthResponseEntity> signup(SignupRequestBody signupRequestBody) async {
    try {
      final response = await authServices.signup(signupRequestBody);
      if (response.user == null) {
        throw AuthError(message: response.message);
      }
      return response.toEntity();
    } catch (e) {
      log(e.toString());
      return Future.error(AuthError(message: e.toString()));
    }
  }

  @override
  Future<AuthResponseEntity> login(LoginRequestBody loginRequestBody) async {
    try {
      final response = await authServices.login(loginRequestBody);
      if (response.user == null) {
        throw AuthError(message: response.message);
      }
      return response.toEntity();
    } catch (e) {
      log(e.toString());
      return Future.error(AuthError(message: e.toString()));
    }
  }
}
