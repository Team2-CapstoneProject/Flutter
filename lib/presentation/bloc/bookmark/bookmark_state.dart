part of 'bookmark_bloc.dart';

@immutable
sealed class BookmarkState {}

final class BookmarkInitial extends BookmarkState {}

final class BookmarkLoading extends BookmarkState {}

final class BookmarkSuccess extends BookmarkState {
  final BookmarkResponModel bookmarkResponModel;
  final List<BookmarkedVila>? bookmarkedVilas;

  BookmarkSuccess(this.bookmarkResponModel, this.bookmarkedVilas);
}

final class ToggleBookmarkSuccess extends BookmarkState {
  final BookmarkResponModel bookmarkResponModel;

  ToggleBookmarkSuccess(this.bookmarkResponModel);
}

final class BookmarkError extends BookmarkState {
  final String errorMessage;

  BookmarkError(this.errorMessage);
}
