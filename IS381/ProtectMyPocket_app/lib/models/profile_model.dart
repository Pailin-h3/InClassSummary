import 'package:cloud_firestore/cloud_firestore.dart';

class Account {
  final String email;
  final String password;

  Account(this.email, this.password);

  factory Account.fromJson(Map<String, dynamic> json) {
    return Account(
      json['email'] as String,
      json['password'] as String,
    );
  }
}

class AllAccounts {
  final List<Account> accounts;

  AllAccounts(this.accounts);

  factory AllAccounts.fromJson(List<dynamic> json) {
    List<Account> accounts = List<Account>();
    accounts = json.map((i) => Account.fromJson(i)).toList();
    return AllAccounts(accounts);
  }

  factory AllAccounts.fromSnapshot(QuerySnapshot qs) {
    List<Account> accounts = qs.docs.map((DocumentSnapshot ds) {
      return Account.fromJson(ds.data());
    }).toList();

    return AllAccounts(accounts);
  }
}
