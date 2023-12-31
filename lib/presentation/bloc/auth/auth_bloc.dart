import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:capstone_project_villa/data/datasources/remote/auth_remote_datasource.dart';
import 'package:capstone_project_villa/data/models/request/forget_password_request_model.dart';
import 'package:capstone_project_villa/data/models/request/login_request_model.dart';
import 'package:capstone_project_villa/data/models/request/register_profile_request_model.dart';
import 'package:capstone_project_villa/data/models/request/register_request_model.dart';
import 'package:capstone_project_villa/data/models/response/auth_response_model.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthLoginEvent>((event, emit) async {
      emit(AuthLoading());
      final result = await ApiDataSource().login(event.loginRequestModel);
      result.fold((error) => emit(AuthError(message: error)),
          (success) => emit(AuthLoaded(authResponseModel: success)));
    });
    on<AuthRegisterEvent>((event, emit) async {
      emit(AuthLoading());
      final result = await ApiDataSource().register(event.registerRequestModel);
      result.fold((error) => emit(AuthError(message: error)),
          (success) => emit(AuthLoaded(authResponseModel: success)));
    });

    on<AuthUpdateProfileEvent>((event, emit) async {
      emit(AuthLoading());

      File? imageFile = event.imageFile;

      final result = await ApiDataSource().registerProfile(
        event.registerProfileRequestModel,
        imageFile!,
      );

      result.fold(
        (error) => emit(AuthError(message: error)),
        (success) => emit(AuthSuccessRegister(authResponseModel: success)),
      );
    });

    on<AuthForgetPasswordEvent>((event, emit) async {
      emit(AuthLoading());
      final result = await ApiDataSource()
          .forgetPassword(event.forgetPasswordRequestModel);
      result.fold((error) => emit(AuthError(message: error)),
          (success) => emit(AuthLoaded(authResponseModel: success)));
    });

    on<AuthLogoutEvent>((event, emit) async {
      final result = await ApiDataSource().logout();
      result.fold((error) => emit(AuthError(message: error)),
          (success) => emit(AuthSuccessLogout(authResponseModel: success)));
    });
  }
}
