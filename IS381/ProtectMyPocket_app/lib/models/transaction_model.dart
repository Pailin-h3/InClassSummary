import 'package:cloud_firestore/cloud_firestore.dart';

class NewTransaction {
  final String from;
  final String type;
  final int amount;
  final DateTime date;
  String firebaseId;

  NewTransaction(this.from, this.type,this.amount,this.date);

  factory NewTransaction.fromJson(Map<String, dynamic> json){
    return NewTransaction(
      json['from'] as String,
      json['type'] as String,
      json['amount'] as int,
      json['date'].toDate() as DateTime,
    );
  }
}

class AllTransactions {
  final List<NewTransaction> transactions;

  AllTransactions(this.transactions);

  factory AllTransactions.fromJson(List<dynamic> json){
    List<NewTransaction> transactions = List<NewTransaction>();
    transactions = json.map((i) => NewTransaction.fromJson(i)).toList();
    return AllTransactions(transactions);
  }
  factory AllTransactions.fromSnapshot(QuerySnapshot qs){
    List<NewTransaction> transactions = qs.docs.map((DocumentSnapshot ds) {
      return NewTransaction.fromJson(ds.data());
    }).toList();
    return AllTransactions(transactions);
  }
}