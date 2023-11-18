part of 'transaction_bloc.dart';

@immutable
sealed class TransactionEvent {}

class GetTransaction extends TransactionEvent {
  final TransactionRequestModel transactionRequestModel;

  GetTransaction({required this.transactionRequestModel});
}
