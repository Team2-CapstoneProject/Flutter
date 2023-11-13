part of 'history_bloc.dart';

@immutable
sealed class HistoryEvent {}

class GetHistoryEvent extends HistoryEvent {}

class GetHistoryByNameEvent extends HistoryEvent {
  final String name;

  GetHistoryByNameEvent({required this.name});
}
