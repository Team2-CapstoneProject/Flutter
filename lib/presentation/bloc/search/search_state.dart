part of 'search_bloc.dart';

@immutable
abstract class SearchState {}

class SearchInitial extends SearchState {}

class SearchLoading extends SearchState {}

class SearchSuccess extends SearchState {
  final SearchResponseModel searchResponse;

  SearchSuccess(this.searchResponse);
}

class SearchError extends SearchState {
  final String errorMessage;

  SearchError(this.errorMessage);
}
