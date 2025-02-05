part of 'transaction_cubit.dart';

@immutable
abstract class TransactionState extends Equatable {
  const TransactionState();

  @override
  // TODO: implement props
  List<Object> get props => [];
}

class TransactionInitial extends TransactionState {}

class TransactionLoading extends TransactionState {}

class TransactionSuccess extends TransactionState {
  final List<TransactionModel> transactions;

  TransactionSuccess(this.transactions);

  @override
  // TODO: implement props
  List<Object> get props => [transactions];
}

class TransactionFailed extends TransactionState {

  final String error;

  TransactionFailed(this.error);

  @override
  // TODO: implement props
  List<Object> get props => [error];
}
