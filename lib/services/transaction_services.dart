import 'package:airplane/models/destinations_model.dart';
import 'package:airplane/models/transaction_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TransactionServices{

  final CollectionReference _transactionReference =
  FirebaseFirestore.instance.collection('transactions');

  Future<void> createTransaction(TransactionModel transaction) async{

    try{
      _transactionReference.add({
        'destinations': transaction.destinations.toJson(),
        'amountOfTraveler': transaction.amountOfTraveler,
        'selectedSeats': transaction.selectedSeats,
        'insurance': transaction.insurance,
        'refundable': transaction.refundable,
        'vat': transaction.vat,
        'price': transaction.price,
        'grandTotal': transaction.grandTotal
      });
    } catch (e){
      throw e;
    }
  }

  Future<List<TransactionModel>> fetchTransactions() async {
    try {
      QuerySnapshot result = await _transactionReference.get();
      
      List<TransactionModel> transactions = result.docs.map((e) {
        return TransactionModel.fromJson(
          e.id, e.data() as Map<String, dynamic>);
      }
      ).toList();

      return transactions;
    } catch(e){
      throw e;
    }
  }

}