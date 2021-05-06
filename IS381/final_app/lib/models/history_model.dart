import 'package:cloud_firestore/cloud_firestore.dart';

class History {
  final String op;
  final String result;

  History(this.op, this.result);

  factory History.fromJson(Map<String, dynamic> json){
    return History(
      json['operation'] as String,
      json['result'] as String,
    );
  }
}

class AllHistoryImport {
  final List<History> histories;

  AllHistoryImport(this.histories);

  factory AllHistoryImport.fromJson(List<dynamic> json){
    List<History> histories = List<History>();
    histories = json.map((i) => History.fromJson(i)).toList();
    return AllHistoryImport(histories);
  }
  factory AllHistoryImport.fromSnapshot(QuerySnapshot qs){
    List<History> histories = qs.docs.map((DocumentSnapshot ds) {
      return History.fromJson(ds.data());
    }).toList();
    return AllHistoryImport(histories);
  }
}