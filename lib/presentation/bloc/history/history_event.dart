part of 'history_bloc.dart';

@immutable
sealed class HistoryEvent {}

class GetHistoryEvent extends HistoryEvent {}

class GetHistoryByNameEvent extends HistoryEvent {
  final String name;

  GetHistoryByNameEvent({required this.name});
}

class GetSpecificEvent extends HistoryEvent {
  final int id;

  GetSpecificEvent({required this.id});
}

class HistoryPaymentEvent extends HistoryEvent {
  final HistoryRequestModel historyRequestModel;
  final int id;

  HistoryPaymentEvent({required this.historyRequestModel, required this.id});
}

class HistoryReviewEvent extends HistoryEvent {
  final ReviewRequestModel review;

  HistoryReviewEvent({required this.review});
}
