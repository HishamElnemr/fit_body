import 'package:bloc/bloc.dart';
import 'package:fb_fitbody/features/auth/data/models/login_request_body.dart';
import 'package:fb_fitbody/features/auth/domain/entities/auth_response_entity.dart';
import 'package:fb_fitbody/features/auth/domain/repositories/auth_repo.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.authRepo) : super(LoginInitial());
  final AuthRepo authRepo;

  Future<void> login(LoginRequestBody loginRequestBody) async {
    emit(LoginLoading());
    try {
      final response = await authRepo.login(loginRequestBody);
      emit(LoginSuccess(authResponseEntity: response));
    } catch (e) {
      emit(LoginError(message: e.toString()));
    }
  }
}
