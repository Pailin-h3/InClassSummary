import 'package:ProtectMyPocket_app/controller/transaction.dart';
import 'package:ProtectMyPocket_app/models/transaction_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddTransaction extends StatefulWidget {
  AddTransaction({Key key, this.title, this.controller}) : super(key: key);
  final String title;
  final TransactionController controller;

  @override
  _AddTransactionState createState() => _AddTransactionState();
}

class _AddTransactionState extends State<AddTransaction> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transaction'),
      ),
      body: AddTransactionForm(controller: widget.controller,),
    );
  }
}

class AddTransactionForm extends StatefulWidget {
  final TransactionController controller;
  AddTransactionForm({Key key, this.controller}) : super(key:key);
  @override
  _AddTransactionFormState createState() => _AddTransactionFormState();
}

class _AddTransactionFormState extends State<AddTransactionForm> {
  final _transactionFormKey = GlobalKey<FormState>();
  String dateHintText = 'Pick up Date';
  bool selectIncome = true;
  
  @override
  Widget build(BuildContext context) {
    TextEditingController dateCtl = TextEditingController();
    return Form(
      key: _transactionFormKey,
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(color: Colors.blueGrey[50]),
            margin: EdgeInsets.only(
              left: 20.0,
              top: 40.0,
              right: 20.0,
            ),
            padding: EdgeInsets.symmetric(),
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                            padding: EdgeInsets.all(4),
                            child: Text("Add Transaction",
                                style: TextStyle(
                                    fontSize: 25.0,
                                    fontWeight: FontWeight.bold))),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
                border: Border.all(width: 10, color: Colors.blueGrey[50]),
                color: Colors.blueGrey[100]),
            margin: EdgeInsets.only(
              left: 20.0,
              right: 20.0,
            ),
            padding: EdgeInsets.symmetric(),
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                            padding: EdgeInsets.all(4),
                            child: Text("Date",
                                style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold))),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextFormField(
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(left: 10.0),
                            border: OutlineInputBorder(),
                            hintText: dateHintText,
                          ),
                          controller: dateCtl,
                          onTap: () async{
                            DateTime date = DateTime.now();
                            FocusScope.of(context).requestFocus(new FocusNode());
                            date = await showDatePicker(
                                          context: context, 
                                          initialDate:DateTime.now(),
                                          firstDate:DateTime(1900),
                                          lastDate: DateTime(2100));
                            dateCtl.text = date.toIso8601String();
                            var model = context.read<TransactionFormModel>();
                            model.addTime(date);
                            setState(() {
                              dateHintText = date.toIso8601String().substring(0,10);
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
                border: Border.all(width: 10, color: Colors.blueGrey[50]),
                color: Colors.blueGrey[100]),
            margin: EdgeInsets.only(
              left: 20.0,
              right: 20.0,
            ),
            padding: EdgeInsets.symmetric(),
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                            padding: EdgeInsets.all(4),
                            child: Text("Amount",
                                style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold))),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextFormField(
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(left: 10.0),
                            border: OutlineInputBorder(),
                            hintText: 'Amount',
                          ),
                          onSaved: (value){
                            var model = context.read<TransactionFormModel>();
                            model.addAmount(int.parse(value));
                          },
                          keyboardType: TextInputType.number,
                        ),
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                          padding: EdgeInsets.all(6),
                          child: Text("THB",
                              style: TextStyle(
                                  fontSize: 20.0, fontWeight: FontWeight.bold))),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
                border: Border.all(width: 10, color: Colors.blueGrey[50]),
                color: Colors.blueGrey[100]),
            margin: EdgeInsets.only(
              left: 20.0,
              right: 20.0,
            ),
            padding: EdgeInsets.symmetric(),
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                            padding: EdgeInsets.all(4),
                            child: Text("Note :",
                                style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold))),
                        TextFormField(
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(left: 10.0),
                            border: OutlineInputBorder(),
                            hintText: 'Note',
                          ),
                          onSaved: (value){
                            var model = context.read<TransactionFormModel>();
                            model.addNote(value);
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(width: 10, color: Colors.blueGrey[50]),
            ),
            margin: EdgeInsets.only(
              left: 20.0,
              right: 20.0,
            ),
            child: Row(
              children: [
                Expanded(
                  child: FlatButton(
                    onPressed: () {
                      selectIncome = true;
                    },
                    color: Colors.green[700],
                    child: Center(child: Text("Income"),),
                  ),
                ),
                Expanded(
                  child: FlatButton(
                    onPressed: () {
                      selectIncome = false;
                    },
                    color: Colors.red[900],
                    child: Center(child: Text("Expense"))
                  ),
                ),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(width: 10, color: Colors.blueGrey[50]),
            ),
            margin: EdgeInsets.only(
              left: 20.0,
              right: 20.0,
            ),
            child: selectIncome? Income() : Expense(),
            // _buildIncomeList(),
            // Text("Should be list..."),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Row(
              children: [
                RaisedButton(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(25, 10, 25, 10),
                    child: Text('Cancle'),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),      
                Spacer(),    
                RaisedButton(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(25, 10, 25, 10),
                    child: Text('Submit'),
                  ),
                  onPressed: () {
                    _transactionFormKey.currentState.save();
                    var model = context.read<TransactionFormModel>();
                    NewTransaction t = NewTransaction(
                      model.note,
                      model.type,
                      model.amount,
                      model.time
                    );
                    widget.controller.addTransaction(t);
                    model.addTransaction();
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class TransactionFormModel extends ChangeNotifier{
  String note;
  int amount;
  String type;
  DateTime time;

  void addNote(String note){
    this.note = note;
  }
  void addAmount(int amount){
    this.amount = amount;
  }
  void addTime(DateTime time){
    this.time = time;
  }
  void addTransaction(){
    notifyListeners();
  }
}

// List<String> incomeType = [
//   'salary',
//   'saving',
//   'bonus'
// ];
// List<String> expenseType = [
//   'food',
//   'tarvel',
//   'cloths'
// ];

class Income extends StatefulWidget {
  @override
  _IncomeState createState() => _IncomeState();
}

class _IncomeState extends State<Income> {
  // bool checked;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('Category')
          .where("type", isEqualTo: "Income")
          .snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return const Text('Loading...');
        return ListView.builder(
            itemCount: snapshot.data.documents.length,
            itemBuilder: (context, index) {
              DocumentSnapshot doc = snapshot.data.documents[index];
              String firebaseId = doc.id;
              return CheckboxListTile(
                title: Text(doc['name']),
                value: doc['selected'],
                onChanged: (bool value) {
                  setState(() async {
                    await FirebaseFirestore.instance
                        .collection('Category')
                        .doc(firebaseId)
                        .update({
                      'selected': value,
                    });
                  });
                },
                activeColor: Colors.amber,
                checkColor: Colors.black,
              );
            });
      },
    );
  }
}

class Expense extends StatefulWidget {
  @override
  _ExpenseState createState() => _ExpenseState();
}

class _ExpenseState extends State<Expense> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('Category')
          .where("type", isEqualTo: "Expense")
          .snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return const Text('Loading...');
        return ListView.builder(
            itemCount: snapshot.data.documents.length,
            itemBuilder: (context, index) {
              DocumentSnapshot doc = snapshot.data.documents[index];
              String firebaseId = doc.id;
              return CheckboxListTile(
                title: Text(doc['name']),
                value: doc['selected'],
                onChanged: (bool value) {
                  setState(() async {
                    await FirebaseFirestore.instance
                        .collection('Category')
                        .doc(firebaseId)
                        .update({
                      'selected': value,
                    });
                  });
                },
                activeColor: Colors.amber,
                checkColor: Colors.black,
              );
            });
      },
    );
  }
}