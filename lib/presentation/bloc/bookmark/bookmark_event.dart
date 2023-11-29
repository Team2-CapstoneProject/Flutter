part of 'bookmark_bloc.dart';

@immutable
sealed class BookmarkEvent {}

class GetBookmarkEvent extends BookmarkEvent {}

class ChangeBookmarkEvent extends BookmarkEvent {
  final BookmarkRequestModel bookmarkRequestModel;

  ChangeBookmarkEvent(this.bookmarkRequestModel);
}

class ToggleBookmarkEvent extends BookmarkEvent {
  final BookmarkRequestModel bookmarkRequestModel;

  ToggleBookmarkEvent(this.bookmarkRequestModel);
}
