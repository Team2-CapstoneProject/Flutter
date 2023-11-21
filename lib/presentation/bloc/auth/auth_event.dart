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
  final File imageFile;

  AuthUpdateProfileEvent({
    required this.registerProfileRequestModel,
    required this.imageFile,
  });
}

class AuthForgetPasswordEvent extends AuthEvent {
  final ForgetPasswordRequestModel forgetPasswordRequestModel;

  AuthForgetPasswordEvent({required this.forgetPasswordRequestModel});
}

class AuthLogoutEvent extends AuthEvent {}
