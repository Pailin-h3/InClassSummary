import 'dart:async';
import 'package:ProtectMyPocket_app/models/transaction_model.dart';
import 'package:ProtectMyPocket_app/services/http_service.dart';

class TransactionController {
  final Service service;
  List<NewTransaction> transactions;

  StreamController<bool> onSynceStreamController = StreamController();
  Stream<bool> get onSync => onSynceStreamController.stream;

  TransactionController(this.service);

  Future<List<NewTransaction>> fetchTransactions() async{
    onSynceStreamController.add(true);
    transactions = await service.getTransactions();
    onSynceStreamController.add(false);
    return transactions;
  }

  void addTransaction(NewTransaction transaction) {
    service.addTransaction(transaction);
  }
}