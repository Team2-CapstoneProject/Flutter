import 'package:bloc/bloc.dart';
import 'package:capstone_project_villa/data/datasources/remote/history_remote_datasource.dart';
import 'package:capstone_project_villa/data/models/request/history_request_model.dart';
import 'package:capstone_project_villa/data/models/request/review_request_model.dart';
import 'package:capstone_project_villa/data/models/response/history_response_model.dart';
import 'package:capstone_project_villa/data/models/response/history_transaction_response_model.dart';
import 'package:meta/meta.dart';

part 'history_event.dart';
part 'history_state.dart';

class HistoryBloc extends Bloc<HistoryEvent, HistoryState> {
  HistoryBloc() : super(HistoryInitial()) {
    on<GetHistoryEvent>((event, emit) async {
      emit(HistoryLoading());
      final result = await HistoryDataSource().getHistory();
      result.fold(
        (error) {
          print("Error getting history data: $error");
          emit(HistoryError(message: error));
        },
        (success) {
          print("History data received successfully");
          emit(HistoryLoaded(historyResponseModel: success));
        },
      );
    });

    on<GetHistoryByNameEvent>((event, emit) async {
      emit(HistoryLoading());
      final result = await HistoryDataSource().getHistoryById(event.name);
      result.fold(
        (error) {
          print("Error getting history data: $error");
          emit(HistoryError(message: error));
        },
        (success) {
          print("History data received successfully");
          emit(HistorySearchLoaded(historyResponseModel: success));
        },
      );
    });

    on<GetSpecificEvent>((event, emit) async {
      emit(HistoryLoading());
      final result = await HistoryDataSource().getHistorySpecific(event.id);
      result.fold(
          (error) => emit(HistoryError(message: error)),
          (success) => emit(
              HistorySpecificLoaded(historyTransactionResponseModel: success)));
    });

    on<HistoryPaymentEvent>((event, emit) async {
      emit(HistoryLoading());
      final result = await HistoryDataSource()
          .payment(event.historyRequestModel, event.id);
      result.fold(
          (error) => emit(HistoryError(message: error)),
          (success) =>
              emit(HistoryPaymentSuccess(historyResponseModel: success)));
    });

    on<HistoryReviewEvent>((event, emit) async {
      emit(HistoryLoading());
      final result = await HistoryDataSource().review(event.review);
      result.fold(
          (error) => emit(HistoryError(message: error)),
          (success) =>
              emit(HistoryReviewLoaded(historyResponseModel: success)));
      // result.fold(
      //     (error) => emit(HistoryError(message: error)),
      //     (success) => emit(
      //         HistorySpecificLoaded(historyTransactionResponseModel: success)));
    });
  }
}
