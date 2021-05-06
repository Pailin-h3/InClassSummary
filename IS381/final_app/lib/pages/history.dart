import 'package:final_app/controllers/history_controller.dart';
import 'package:final_app/models/history_model.dart';
import 'package:final_app/services/history_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HistoryPage extends StatefulWidget {
  static final HistoryService historyService = HistoryService();
  final HistoryController historyController = HistoryController(historyService);

  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  bool loadedHistory = false;

  void _getHistories() async{
    var newHistories = await widget.historyController.fetchHistories();
    var model = context.read<AllHistory>();
    model.load_histories(newHistories);
  }
  void _delHistories() async{
    await widget.historyController.deleteAllHistory();
    _getHistories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("History"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: (){
              var model = context.read<AllHistory>();
              model.clear_history();
              _delHistories();
            },
          ),
        ],
      ),
      body: Consumer<AllHistory>(
        builder: (BuildContext context, value, Widget child) {
          return ListView.builder(
            itemCount: value.allHistory.length == 0 ? 1 : value.allHistory.length,
            itemBuilder: (context, index){
              TextStyle bigsize = TextStyle(fontSize: 40, fontWeight: FontWeight.normal);
              TextStyle smallsize = TextStyle(fontSize: 20, fontWeight: FontWeight.normal);
              if(value.allHistory.length == 0){
                if(!loadedHistory){
                  _getHistories();
                  loadedHistory = true;
                  return Text('Loading...');
                }else return Text('');
              }else{
                var all = value.allHistory;
                return Container(
                  alignment: Alignment.centerRight,
                  padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
                  child: Column(
                    children: [
                      Text(
                        all[index].op,
                        style: smallsize,
                      ),
                      Text(
                        all[index].result,
                        style: bigsize,
                      ),
                    ],
                    crossAxisAlignment: CrossAxisAlignment.end,
                  ),
                );
              }
            },
          );
        },
      ),
    );
  }
}

class AllHistory extends ChangeNotifier{
  List<History> allHistory = [];

  void new_history(History h){
    allHistory.add(h);
    notifyListeners();
  }

  void load_histories(List<History> allh){
    allHistory = allh;
    notifyListeners();
  }

  void clear_history(){
    allHistory = [];
    notifyListeners();
  }
}