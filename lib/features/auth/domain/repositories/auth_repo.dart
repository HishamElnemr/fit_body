import 'package:fb_fitbody/features/auth/data/models/login_request_body.dart';
import 'package:fb_fitbody/features/auth/data/models/signup_request_body.dart';
import 'package:fb_fitbody/features/auth/domain/entities/auth_response_entity.dart';

abstract class AuthRepo {
  Future<AuthResponseEntity> signup(SignupRequestBody signupRequestBody);
  Future<AuthResponseEntity> login(LoginRequestBody loginRequestBody);
}
