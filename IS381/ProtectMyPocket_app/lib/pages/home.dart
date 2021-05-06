import 'dart:math';
import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transaction List'),
      ),
      body: TransactionList(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add your onPressed code here!
        },
        child: Icon(Icons.add),
        backgroundColor: Theme.of(context).accentColor,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('Transaction'),
              backgroundColor: Colors.blue),
          BottomNavigationBarItem(
              icon: Icon(Icons.donut_small),
              title: Text('Overview'),
              backgroundColor: Colors.blue),
          BottomNavigationBarItem(
              icon: Icon(Icons.create),
              title: Text('Budget'),
              backgroundColor: Colors.blue),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              title: Text('Setting'),
              backgroundColor: Colors.blue),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}

class NewTransaction {
  NewTransaction(this.type,this.amount,this.date);

  String type;
  double amount;
  DateTime date;
}

List<NewTransaction> transactions = List.generate(100, (i) => NewTransaction("transaction ${i.toString()}", Random().nextDouble(), DateTime.now()));

class TransactionList extends StatefulWidget {
  @override
  _TransactionListState createState() => _TransactionListState();
}

class _TransactionListState extends State<TransactionList> {


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(),
          height: 80,
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Row(
              children: [
                Expanded(
                  child: Card(
                    child: Column(
                      children: [
                        Padding(padding: EdgeInsets.all(4),child: Text("Income")),
                        Padding(padding: EdgeInsets.all(4),child: Text("50,000")),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Card(
                    child: Column(
                      children: [
                        Padding(padding: EdgeInsets.all(4),child: Text("Expense")),
                        Padding(padding: EdgeInsets.all(4),child: Text("30,000")),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Card(
                    child: Column(
                      children: [
                        Padding(padding: EdgeInsets.all(4),child: Text("Total")),
                        Padding(padding: EdgeInsets.all(4),child: Text("20,000")),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Divider(),
        Padding(
          padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
          child: Row(
            children: [
              Expanded(flex: 4,child: Padding(padding: EdgeInsets.fromLTRB(20, 2, 0, 2), child: Text('รายการ'))),
              Expanded(flex: 3,child: Padding(padding: EdgeInsets.fromLTRB(30, 2, 0, 2), child: Text('จำนวน'))),
              Expanded(flex: 3,child: Padding(padding: EdgeInsets.fromLTRB(50, 2, 20, 2), child: Text('เวลา'))),
            ],
          )
        ),
        Divider(),
        Expanded(
          flex: 8,
          child: ListView.builder(
            itemCount: transactions.length,
            itemBuilder: (context, index){
              return Row(
                children: [
                 Expanded(flex: 4,child: Padding(padding: EdgeInsets.fromLTRB(20, 2, 0, 2), child: Text('${transactions[index].type}'))),
                 Expanded(flex: 3,child: Padding(padding: EdgeInsets.fromLTRB(20, 2, 40, 2), child: Text('${(transactions[index].amount*10000).round()}', textAlign: TextAlign.right))),
                 Expanded(flex: 3,child: Padding(padding: EdgeInsets.fromLTRB(0, 2, 20, 2), child: Text('${transactions[index].date.hour}.${transactions[index].date.minute}', textAlign: TextAlign.right))),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
