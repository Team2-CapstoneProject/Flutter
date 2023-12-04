part of 'profile_bloc.dart';

@immutable
sealed class ProfileEvent {}

class ProfileGetUserEvent extends ProfileEvent {}

class ProfileUpdateEvent extends ProfileEvent {
  final ProfileRequestModel profileRequestModel;
  final File imageFile;

  ProfileUpdateEvent({
    required this.profileRequestModel,
    required this.imageFile,
  });
}
