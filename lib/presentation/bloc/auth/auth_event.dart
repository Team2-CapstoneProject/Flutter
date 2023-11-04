part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

class AuthLoginEvent extends AuthEvent {
  final LoginRequestModel loginRequestModel;

  AuthLoginEvent({required this.loginRequestModel});
}
