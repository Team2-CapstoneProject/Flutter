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

final class AuthSuccessLogout extends AuthState {
  final AuthResponseModel authResponseModel;

  AuthSuccessLogout({required this.authResponseModel});
}

final class AuthError extends AuthState {
  final String message;

  AuthError({required this.message});
}
