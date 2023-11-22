import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:capstone_project_villa/data/datasources/remote/profile_remote_datasource.dart';
import 'package:capstone_project_villa/data/models/request/profile_request_model.dart';
import 'package:capstone_project_villa/data/models/response/profile_response_model.dart';
import 'package:meta/meta.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileInitial()) {
    // Get User Profile
    on<ProfileGetUserEvent>((event, emit) async {
      emit(ProfileLoading());
      final result = await ProfileDataSource().getProfile();
      result.fold((error) => emit(ProfileError(message: error)),
          (success) => emit(ProfileLoaded(profileResponseModel: success)));
    });

    // Update User Profile
    on<ProfileUpdateEvent>((event, emit) async {
      emit(ProfileLoading());
      final result = await ProfileDataSource()
          .updateProfile(event.profileRequestModel, event.imageFile!);
      result.fold((error) => emit(ProfileError(message: error)),
          (success) => emit(ProfileLoaded(profileResponseModel: success)));
    });
  }
}
