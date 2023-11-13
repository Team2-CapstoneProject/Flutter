import 'package:bloc/bloc.dart';
import 'package:capstone_project_villa/data/datasources/remote/history_remote_datasource.dart';
import 'package:capstone_project_villa/data/models/response/history_response_model.dart';
import 'package:meta/meta.dart';

part 'history_event.dart';
part 'history_state.dart';

class HistoryBloc extends Bloc<HistoryEvent, HistoryState> {
  HistoryBloc() : super(HistoryInitial()) {
    on<GetHistoryEvent>((event, emit) async {
      emit(HistoryLoading());
      final result = await HistoryDataSource().getHistory();
      result.fold((error) => emit(HistoryError(message: error)),
          (success) => emit(HistoryLoaded(historyResponseModel: success)));
    });

    on<GetHistoryByNameEvent>((event, emit) async {
      emit(HistoryLoading());
      final result = await HistoryDataSource().getHistoryById(event.name);
      result.fold(
          (error) => emit(HistoryError(message: error)),
          (success) =>
              emit(HistorySearchLoaded(historyResponseModel: success)));
    });
  }
}
