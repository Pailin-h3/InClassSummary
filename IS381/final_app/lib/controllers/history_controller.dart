import 'dart:async';
import 'package:final_app/models/history_model.dart';
import 'package:final_app/services/history_service.dart';

class HistoryController {
  final HistoryService service;
  List<History> histories;

  StreamController<bool> onSynceStreamController = StreamController();
  Stream<bool> get onSync => onSynceStreamController.stream;

  HistoryController(this.service);

  Future<List<History>> fetchHistories() async{
    onSynceStreamController.add(true);
    histories = await service.getHistories();
    onSynceStreamController.add(false);
    return histories;
  }

  void addHistory(History history) {
    service.addHistory(history);
  }

  void deleteAllHistory() {
    service.deleteAllHistory();
  }
}