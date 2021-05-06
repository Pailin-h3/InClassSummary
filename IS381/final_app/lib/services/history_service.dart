import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_app/models/history_model.dart';

class HistoryService {
  Future<List<History>> getHistories() async{
    QuerySnapshot snapshot =  await FirebaseFirestore.instance.collection('calculator_history').get();
    AllHistoryImport allHistory = AllHistoryImport.fromSnapshot(snapshot);
    var histories = allHistory.histories;
    return histories;
  }

  void addHistory(History history) async{
    CollectionReference allHistory = FirebaseFirestore.instance.collection('calculator_history');
    await allHistory.add({
      'operation' : history.op,
      'result' : history.result,
    })
    .then((value) => print("History Added"))
    .catchError((error) => print("Failed to add history: $error"));
  }

  void deleteAllHistory() async{
    await FirebaseFirestore.instance.collection('calculator_history').get().then((snapshot) {
      for (DocumentSnapshot ds in snapshot.docs){
        ds.reference.delete();
      }
    });
  }
}
