import 'package:airplane/cubit/transaction_cubit.dart';
import 'package:airplane/ui/widgets/transaction_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TransactionPage extends StatefulWidget {
  const TransactionPage({Key? key}) : super(key: key);

  @override
  State<TransactionPage> createState() => _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage> {

  @override
  void initState() {
    // TODO: implement initState
    context.read<TransactionCubit>().fetchTransactions();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TransactionCubit, TransactionState>(
      builder: (context, state) {

        if(state is TransactionLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        else if(state is TransactionSuccess){
          if(state.transactions.length == 0){
            return Center(
              child: Text('Kamu belum memiliki transaksi'),
            );
          } else {
            return ListView.builder(
                itemCount: state.transactions.length,
                itemBuilder: (context, index){
              return TransactionCard(
                  state.transactions[index]);
            });
          }
        }

        return Center(
          child: Text(
              'Transaction Page'
          ),
        );
      },
    );
  }
}
