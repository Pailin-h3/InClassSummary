import 'package:ProtectMyPocket_app/models/transaction_model.dart';
import 'package:ProtectMyPocket_app/models/profile_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:http/http.dart';
import 'dart:convert';

abstract class OngsaService {
  Future<List<Account>> getAccounts();
}

class OngsaFireBaseService implements OngsaService {
  @override
  Future<List<Account>> getAccounts() async {
    QuerySnapshot snapshot =
        await FirebaseFirestore.instance.collection("users").get();

    AllAccounts accounts = AllAccounts.fromSnapshot(snapshot);
    return accounts.accounts;
  }
}


abstract class Service{
  Future<List<NewTransaction>> getTransactions();
  void addTransaction(NewTransaction transaction);
  // Future<NewTransaction> updateTransaction(NewTransaction transaction);
}

class FirebaseService implements Service{
  @override
  Future<List<NewTransaction>> getTransactions() async{
    QuerySnapshot snapshot =  await FirebaseFirestore.instance.collection('transactions').get();
    AllTransactions alltransactions = AllTransactions.fromSnapshot(snapshot);
    var transactions = alltransactions.transactions;
    transactions.sort((a, b) => a.date.compareTo(b.date));
    return transactions;
  }

  @override
  void addTransaction(NewTransaction transaction) async{
    CollectionReference transactions = FirebaseFirestore.instance.collection('transactions');
    await transactions.add({
      'amount' : transaction.amount,
      'date' : transaction.date,
      'from' : transaction.from,
      'type' : transaction.type
    })
    .then((value) => print("User Added"))
    .catchError((error) => print("Failed to add user: $error"));
  }
}

class HttpService implements Service{
  Client client = Client();

  Future<List<NewTransaction>> getTransactions() async{
    final response = await client.get(
      'https://jsonplaceholder.typicode.com/transactions'
    );

    if(response.statusCode == 200){
      var all = AllTransactions.fromJson(
        json.decode(response.body),
      );
      return all.transactions;
    }else{
      throw Exception('Failed to load Transactions');
    }
  }

  @override
  Future<NewTransaction> addTransaction(NewTransaction transaction) {
    // TODO: implement addTransaction
    throw UnimplementedError();
  }
}