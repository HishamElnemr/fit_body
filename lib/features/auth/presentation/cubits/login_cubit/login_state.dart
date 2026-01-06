part of 'login_cubit.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}

final class LoginLoading extends LoginState {}

final class LoginSuccess extends LoginState {
  final AuthResponseEntity authResponseEntity;
  LoginSuccess({required this.authResponseEntity});
}

final class LoginError extends LoginState {
  final String message;
  LoginError({required this.message});
}
