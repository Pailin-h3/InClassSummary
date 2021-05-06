import 'package:ProtectMyPocket_app/services/http_service.dart';
import 'package:flutter/material.dart';
import 'package:ProtectMyPocket_app/pages/budget_management.dart';
import 'package:ProtectMyPocket_app/pages/overview.dart';
import 'package:ProtectMyPocket_app/pages/add_transaction.dart';
import 'package:ProtectMyPocket_app/pages/setting_screen.dart';
import 'package:ProtectMyPocket_app/models/transaction_model.dart';
import 'package:ProtectMyPocket_app/controller/transaction.dart';
import 'package:provider/provider.dart';
// import 'package:provider/provider.dart';

class HomePage1 extends StatefulWidget {
  HomePage1({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}
int _currentIndex = 0;
class _HomePageState extends State<HomePage1> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Protect My Pocket'),
      ),
      body: SelectBody(),
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

class SelectBody extends StatefulWidget{
  @override
  _SelectBodyState createState() => _SelectBodyState();
}

class _SelectBodyState extends State<SelectBody> {
  @override
  Widget build(BuildContext context) {
    if(_currentIndex == 0) return TransactionList();
    if(_currentIndex == 1) return OverviewBody();
    if(_currentIndex == 2) return BudgetManagementPage();
    else return Setting();
  }
}

class TransactionList extends StatefulWidget {
  static Service service = FirebaseService();
  TransactionController transactionController = TransactionController(service);

  @override
  _TransactionListState createState() => _TransactionListState();
}

class _TransactionListState extends State<TransactionList> {
  List<NewTransaction> transactions;
  bool transactionIsLoading = false;
  bool added = false;
  
  void initState(){
    super.initState();
    widget.transactionController.onSync.listen(
      (bool synceState) => setState((){
        transactionIsLoading = synceState;
      })
    );
  }
  void _getTransactions() async{
    var newTransactions = await widget.transactionController.fetchTransactions();
    setState(() => transactions = newTransactions);
  }

  @override
  Widget build(BuildContext context) {
    if(transactionIsLoading) return Center(child: CircularProgressIndicator());
    else return Column(
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
        Expanded(
          flex: 8,
          child: Consumer<TransactionFormModel>(
            builder: (context, transaction, child){
              if(added){
                NewTransaction t = NewTransaction(
                  transaction.note,
                  transaction.type,
                  transaction.amount,
                  transaction.time,
                );
                transactions.add(t);
              }
              return ListView.builder(
                itemCount: transactions!=null? transactions.length : 1,
                itemBuilder: (context, index){
                  if(transactions!=null){
                    bool isIncome = transactions[index].amount>=0;
                    if(index == 0){
                      return Column(
                        children: [
                          Divider(),
                          Container(
                            color: Colors.blueGrey[200],
                            height: 40,
                            child: Row(
                              children: [
                                Expanded(flex: 4,child: Padding(padding: EdgeInsets.fromLTRB(20, 2, 0, 2), child: Text('day ${transactions[index].date.day}/${transactions[index].date.month}/${transactions[index].date.year}'))),
                                Expanded(flex: 3,child: Padding(padding: EdgeInsets.fromLTRB(20, 2, 40, 2), child: Text('Income', textAlign: TextAlign.right))),
                                Expanded(flex: 3,child: Padding(padding: EdgeInsets.fromLTRB(0, 2, 20, 2), child: Text('Expense', textAlign: TextAlign.right))),
                              ],
                            ),
                          ),
                          Divider(),
                          Row(
                            children: [
                              Expanded(flex: 4,child: Padding(padding: EdgeInsets.fromLTRB(20, 2, 0, 2), child: Text('${transactions[index].from}'))),
                              Expanded(flex: 6,child: Padding(padding: EdgeInsets.fromLTRB(20, 2, 20, 2), child: Text('${transactions[index].amount}', textAlign: isIncome? TextAlign.left : TextAlign.right))),
                            ],
                          ),
                        ]
                      );
                    }
                    else if(transactions[index].date.day == transactions[index-1].date.day){
                      return Row(
                        children: [
                        Expanded(flex: 4,child: Padding(padding: EdgeInsets.fromLTRB(20, 2, 0, 2), child: Text('${transactions[index].from}'))),
                        Expanded(flex: 6,child: Padding(padding: EdgeInsets.fromLTRB(20, 2, 20, 2), child: Text('${transactions[index].amount}', textAlign: isIncome? TextAlign.left : TextAlign.right))),
                        ],
                      );
                    }
                    else {
                      return Column(
                        children: [
                          Divider(),
                          Container(
                            color: Colors.blueGrey[200],
                            height: 40,
                            child: Row(
                              children: [
                                Expanded(flex: 4,child: Padding(padding: EdgeInsets.fromLTRB(20, 2, 0, 2), child: Text('day ${transactions[index].date.day}/${transactions[index].date.month}/${transactions[index].date.year}'))),
                                Expanded(flex: 3,child: Padding(padding: EdgeInsets.fromLTRB(20, 2, 40, 2), child: Text('Income', textAlign: TextAlign.right))),
                                Expanded(flex: 3,child: Padding(padding: EdgeInsets.fromLTRB(0, 2, 20, 2), child: Text('Expense', textAlign: TextAlign.right))),
                              ],
                            ),
                          ),
                          Divider(),
                          Row(
                            children: [
                              Expanded(flex: 4,child: Padding(padding: EdgeInsets.fromLTRB(20, 2, 0, 2), child: Text('${transactions[index].from}'))),
                              Expanded(flex: 6,child: Padding(padding: EdgeInsets.fromLTRB(20, 2, 20, 2), child: Text('${transactions[index].amount}', textAlign: isIncome? TextAlign.left : TextAlign.right))),
                            ],
                          ),
                        ]
                      );
                    }
                  }else{
                    _getTransactions();
                    return Text("Loading...");
                  }
                },
              );
            }
          )
        ),
        Container(
          child: IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              added = true;
              Navigator.push(context, MaterialPageRoute(builder: (context) => AddTransaction(controller: widget.transactionController,)));
            }, 
          ),
        ),
      ],
    );
  }
}
