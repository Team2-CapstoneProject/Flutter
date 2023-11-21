part of 'profile_bloc.dart';

@immutable
sealed class ProfileEvent {}

class ProfileGetUserEvent extends ProfileEvent {}

class ProfileUpdateEvent extends ProfileEvent {
  final ProfileRequestModel profileRequestModel;

  ProfileUpdateEvent({required this.profileRequestModel});
}
