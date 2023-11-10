part of 'detail_vila_bloc.dart';

@immutable
sealed class DetailVilaEvent {}

class GetDetailEvent extends DetailVilaEvent {
  final int id;

  GetDetailEvent({required this.id});
}
