part of 'detail_vila_bloc.dart';

@immutable
sealed class DetailVilaState {}

final class DetailVilaInitial extends DetailVilaState {}

final class DetailVilaLoading extends DetailVilaState {}

final class DetailVilaLoaded extends DetailVilaState {
  final DetailResponModel detail;

  DetailVilaLoaded({required this.detail});
}

final class DetailVilaError extends DetailVilaState {
  final String message;

  DetailVilaError({required this.message});
}
