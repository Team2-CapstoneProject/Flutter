part of 'search_bloc.dart';

@immutable
abstract class SearchEvent {}

class PerformSearch extends SearchEvent {
  final SearchRequestModel searchRequestModel;

  PerformSearch(this.searchRequestModel);
}
