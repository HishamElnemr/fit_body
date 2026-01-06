import 'package:dio/dio.dart';
import 'package:fb_fitbody/core/constants/api_constants.dart';
import 'package:fb_fitbody/features/auth/data/models/auth_response.dart';
import 'package:fb_fitbody/features/auth/data/models/login_request_body.dart';
import 'package:fb_fitbody/features/auth/data/models/signup_request_body.dart';
import 'package:retrofit/retrofit.dart';

part 'auth_services.g.dart';

@RestApi(baseUrl: ApiConstants.authBaseUrl)
abstract class AuthServices {
  factory AuthServices(Dio dio) = _AuthServices;
  @POST('signup')
  Future<AuthResponse> signup(@Body() SignupRequestBody signupRequestBody);

  @POST('login')
  Future<AuthResponse> login(@Body() LoginRequestBody loginRequestBody);
}
