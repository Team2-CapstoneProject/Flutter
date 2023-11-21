part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class AuthLoading extends AuthState {}

final class AuthLoaded extends AuthState {
  final AuthResponseModel authResponseModel;

  AuthLoaded({required this.authResponseModel});
}

final class AuthSuccessRegister extends AuthState {
  final AuthResponseModel authResponseModel;

  AuthSuccessRegister({required this.authResponseModel});
}

final class AuthSucessLogout extends AuthState {
  final AuthResponseModel authResponseModel;

  AuthSucessLogout({required this.authResponseModel});
}

final class AuthError extends AuthState {
  final String message;

  AuthError({required this.message});
}
