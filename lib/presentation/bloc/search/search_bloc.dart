import 'package:bloc/bloc.dart';
import 'package:capstone_project_villa/data/datasources/remote/search_remote_datasource.dart';
import 'package:capstone_project_villa/data/models/request/search_request_model.dart';
import 'package:capstone_project_villa/data/models/response/search_response_model.dart';
import 'package:meta/meta.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(SearchInitial()) {
    on<PerformSearch>((event, emit) async {
      emit(SearchLoading());

      try {
        final searchDataSource = SearchDataSource();
        final searchResponse =
            await searchDataSource.searchVillas(event.searchRequestModel);

        searchResponse.fold(
          (error) => emit(SearchError(error)),
          (result) => emit(SearchSuccess(result)),
        );
      } catch (e) {
        emit(SearchError('An error occurred during the search.'));
      }
    });
  }
}
