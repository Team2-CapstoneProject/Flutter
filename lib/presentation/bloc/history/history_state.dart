part of 'history_bloc.dart';

@immutable
sealed class HistoryState {}

final class HistoryInitial extends HistoryState {}

final class HistoryLoading extends HistoryState {}

final class HistoryLoaded extends HistoryState {
  final HistoryResponseModel historyResponseModel;

  HistoryLoaded({required this.historyResponseModel});
}

final class HistoryError extends HistoryState {
  final String message;

  HistoryError({required this.message});
}