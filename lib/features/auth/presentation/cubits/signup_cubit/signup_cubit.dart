import 'package:bloc/bloc.dart';
import 'package:fb_fitbody/features/auth/data/models/signup_request_body.dart';
import 'package:fb_fitbody/features/auth/domain/entities/auth_response_entity.dart';
import 'package:fb_fitbody/features/auth/domain/repositories/auth_repo.dart';
import 'package:meta/meta.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit(this.authRepo) : super(SignupInitial());
  final AuthRepo authRepo;

  Future<void> signup(SignupRequestBody signupRequestBody) async {
    emit(SignupLoading());
    try {
      final response = await authRepo.signup(signupRequestBody);
      emit(SignupSuccess(authResponseEntity: response));
    } catch (e) {
      emit(SignupError(message: e.toString()));
    }
  }
}
