import 'package:airplane/models/transaction_model.dart';
import 'package:airplane/services/transaction_services.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'transaction_state.dart';

class TransactionCubit extends Cubit<TransactionState> {
  TransactionCubit() : super(TransactionInitial());

  void createTransaction(TransactionModel transaction) async {
    try {

      emit(TransactionLoading());
      await TransactionServices().createTransaction(transaction);
      emit(TransactionSuccess([]));

    } catch (e) {
      emit(TransactionFailed(e.toString()));
    }
  }

  void fetchTransactions() async{
    try {
      emit(TransactionLoading());

      List<TransactionModel> transactions =
          await TransactionServices().fetchTransactions();

      emit(TransactionSuccess(transactions));
    } catch (e){
      emit(TransactionFailed(e.toString()));
    }
  }
}
