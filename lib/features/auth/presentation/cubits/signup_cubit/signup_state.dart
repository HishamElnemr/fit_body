part of 'signup_cubit.dart';

@immutable
sealed class SignupState {}

final class SignupInitial extends SignupState {}

final class SignupLoading extends SignupState {}

final class SignupSuccess extends SignupState {
  final AuthResponseEntity authResponseEntity;
  SignupSuccess({required this.authResponseEntity});
}

final class SignupError extends SignupState {
  final String message;
  SignupError({required this.message});
}
