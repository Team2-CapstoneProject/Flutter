part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

class AuthLoginEvent extends AuthEvent {
  final LoginRequestModel loginRequestModel;

  AuthLoginEvent({required this.loginRequestModel});
}

class AuthRegisterEvent extends AuthEvent {
  final RegisterRequestModel registerRequestModel;

  AuthRegisterEvent({required this.registerRequestModel});
}

class AuthUpdateProfileEvent extends AuthEvent {
  final RegisterProfileRequestModel registerProfileRequestModel;

  AuthUpdateProfileEvent({required this.registerProfileRequestModel});
}
