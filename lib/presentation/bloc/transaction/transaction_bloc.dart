import 'package:bloc/bloc.dart';
import 'package:capstone_project_villa/data/datasources/remote/transaction_remote_datasource.dart';
import 'package:capstone_project_villa/data/models/request/transaction_request_model.dart';
import 'package:capstone_project_villa/data/models/response/transaction_response_model.dart';
import 'package:meta/meta.dart';

part 'transaction_event.dart';
part 'transaction_state.dart';

class TransactionBloc extends Bloc<TransactionEvent, TransactionState> {
  TransactionBloc() : super(TransactionInitial()) {
    on<GetTransaction>((event, emit) async {
      emit(TransactionLoading());
      final result = await TransactionDataSource()
          .getTransaction(event.transactionRequestModel);
      result.fold((error) => emit(TransactionError(message: error)),
          (success) => emit(TransactionLoaded(transactionResponse: success)));
    });
  }
}
