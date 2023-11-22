import 'package:bloc/bloc.dart';
import 'package:capstone_project_villa/data/datasources/remote/bookmark_remote_datasource.dart';
import 'package:capstone_project_villa/data/models/request/bookmark_request_model.dart';
import 'package:capstone_project_villa/data/models/response/bookmark_response_model.dart';
import 'package:meta/meta.dart';

part 'bookmark_event.dart';
part 'bookmark_state.dart';

class BookmarkBloc extends Bloc<BookmarkEvent, BookmarkState> {
  BookmarkBloc() : super(BookmarkInitial()) {
    List<BookmarkedVila>? bookmarkedVilas;

    on<GetBookmarkEvent>((event, emit) async {
      emit(BookmarkLoading());

      final result = await BookmarkDataSource().getBookmark();

      result.fold(
        (error) => emit(BookmarkError(error)),
        (success) {
          bookmarkedVilas = success.bookmarkedVila;
          return emit(BookmarkSuccess(success, bookmarkedVilas));
        },
      );
    });

    on<ChangeBookmarkEvent>((event, emit) async {
      emit(BookmarkLoading());

      final result =
          await BookmarkDataSource().doBookmark(event.bookmarkRequestModel);
      result.fold(
        (error) => emit(BookmarkError(error)),
        (success) {
          // print('masuk bloc change success');
          bookmarkedVilas!
              .removeWhere((x) => x.vila_id == event.bookmarkRequestModel.id);
          return emit(BookmarkSuccess(success, bookmarkedVilas));
        },
      );
    });
  }
}
