import 'package:final_app/controllers/history_controller.dart';
import 'package:final_app/models/history_model.dart';
import 'package:final_app/operator/calculator.dart';
import 'package:final_app/operator/memory.dart';
import 'package:final_app/pages/blankPage.dart';
import 'package:final_app/pages/history.dart';
import 'package:final_app/services/history_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool selectStandard = true;
  String title = "Standard";

  void changePage(bool b, String t){
    setState(() {
      selectStandard = b;
      title = t;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: [
          IconButton(
            icon: Icon(Icons.history), 
            onPressed: (){
              var model = context.read<Operator>();
              model.delete_all();
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HistoryPage())
              );
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: Column(
          children: [
            InkWell(
              onTap: () {},
              child: ListTile(title: Text(""))
            ),
            InkWell(
              onTap: () => changePage(true, 'Standard'),
              child: ListTile(title: Text("Standard"),
              leading: Icon(Icons.pets))
            ),
            InkWell(
              onTap: () => changePage(false, 'Scientific'),
              child: ListTile(title: Text("Scientific"),
              leading: Icon(Icons.pets))
            ),
            InkWell(
              onTap: () => changePage(false, 'Accounting'),
              child: ListTile(title: Text("Accounting"),
              leading: Icon(Icons.pets))
            ),
          ],
        ),
      ),
      body: !selectStandard? BlankPage() : Column(
        children: <Widget>[
          Expanded(
            flex: 2,
            child: NumberDisplay(),
          ),
          Expanded(
            flex: 1,
            child: MemoryDisplay(),
          ),
          Expanded(
            flex: 7,
            child: CalculatorDisplay(),
          ),
        ],
      ),
    );
  }
}

List<String> calculatorButtons = [
  'CE','%','/','<-',
  '7','8','9','x',
  '4','5','6','-',
  '1','2','3','+',
  '+/-','0','.','=',
];
List<String> memoryButtons = [
  'MC','M+','M-','MR'
];

class MemoryDisplay extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    void tab_memory(String tab){
      var memorymodel = context.read<Memory>();
      var calmodel = context.read<Operator>();
      switch(tab){
        case 'MC': {
          memorymodel.clear_memory();
          break;
        }
        case 'M+': {
          double outcome = calmodel.callM();
          memorymodel.plus_memory(outcome);
          calmodel.outcome = memorymodel.send_memory().toString();
          break;
        }
        case 'M-': {
          double outcome = calmodel.callM();
          memorymodel.minus_memory(outcome);
          calmodel.outcome = memorymodel.send_memory().toString();
          break;
        }
        case 'MR': {
          calmodel.callMR(memorymodel.send_memory());
          break;
        }
      }
    }

    TextStyle bigsize = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,),
      itemCount: memoryButtons.length, 
      itemBuilder: (context, index){
        return TextButton(
          onPressed: () {
            tab_memory(memoryButtons[index]);
          },
          child: Center(
            child: Text('${memoryButtons[index]}',
            style: bigsize,
            )
          ),
        );
      }
    );
  }
}

class CalculatorDisplay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextStyle bigsize = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,),
      itemCount: calculatorButtons.length, 
      itemBuilder: (context, index){
        return Card(
          color: Theme.of(context).accentColor,
          child: InkWell(
            onTap: (){
              var model = context.read<Operator>();
              model.tap(calculatorButtons[index]);
            },
            child: Center(
              child: Text('${calculatorButtons[index]}',
              style: bigsize,
              )
            ),
          ),
        );
      }
    );
  }
}

class NumberDisplay extends StatelessWidget {
  static final HistoryService historyService = HistoryService();
  final HistoryController historyController = HistoryController(historyService);

  @override
  Widget build(BuildContext context) {
    TextStyle bigsize = TextStyle(fontSize: 40, fontWeight: FontWeight.bold);
    TextStyle smallsize = TextStyle(fontSize: 20, fontWeight: FontWeight.normal);
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Container(
            alignment: Alignment.topCenter,
            padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
            child: Consumer<Memory>(
              builder: (BuildContext context, value, Widget child){
                if(value.send_memory() != 0) return Text("M");
                else return Text("");
              }
            ),
          ),
        ),
        Expanded(
          flex: 9,
          child: Consumer <Operator>(
            builder: (BuildContext context, value, Widget child) {
              String minus;
              if(value.is_minus){
                minus = '-';
              }else{
                minus = '';
              }
              if(needToSave){
                var model = context.watch<AllHistory>();
                model.new_history(History(value.op, value.outcome));
                historyController.addHistory(History(value.op, value.outcome));
                needToSave = false;
              }
              return Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: <Widget>[
                    Container(
                      alignment: Alignment.centerRight,
                      child: Text(
                        minus + value.op,
                        style: value.equalIsTapped? smallsize : bigsize,
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerRight,
                      child: Text(
                        value.outcome,
                        style: value.equalIsTapped? bigsize : smallsize,
                      ),
                    ),
                  ],
                  mainAxisAlignment: MainAxisAlignment.start,
                ),
              );
            }
          ),
        ),
      ],
    );
  }
}