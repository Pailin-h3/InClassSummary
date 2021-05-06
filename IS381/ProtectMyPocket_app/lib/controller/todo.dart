import 'dart:async';

import 'package:ProtectMyPocket_app/models/profile_model.dart';
import 'package:ProtectMyPocket_app/services/http_service.dart';

class AccountController {
  final OngsaService service;
  List<Account> accounts;

  StreamController<bool> onSyncStreamController = StreamController();
  Stream<bool> get onSync => onSyncStreamController.stream;

  AccountController(this.service);

  Future<List<Account>> fetchAccounts() async {
    onSyncStreamController.add(true);
    accounts = await service.getAccounts();
    onSyncStreamController.add(false);
    return accounts;
  }
}
