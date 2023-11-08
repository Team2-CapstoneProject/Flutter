part of 'profile_bloc.dart';

@immutable
sealed class ProfileEvent {}

class ProfileGetUserEvent extends ProfileEvent {}
