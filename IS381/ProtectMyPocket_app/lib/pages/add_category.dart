import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddCategory extends StatefulWidget {
  @override
  _AddCategoryState createState() => _AddCategoryState();
}

bool selectInc = true;

class _AddCategoryState extends State<AddCategory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Category Setting"),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        height: 550,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(2.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Card(
                    color: Colors.green,
                    child: FlatButton(
                      onPressed: () {
                        setState(() {
                          selectInc = true;
                        });
                      },
                      child: Text("Income", textAlign: TextAlign.center),
                    ),
                  ),
                  Card(
                    color: Colors.red,
                    child: FlatButton(
                      onPressed: () {
                        setState(() {
                          selectInc = false;
                        });
                      },
                      child: Text("Expense", textAlign: TextAlign.center),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 8,
              child: selectInc ? AddIncome() : AddExpense(),
            ),
            SizedBox(height: 20),
            FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: () {
                _showAlertDialog(context, selectInc);
              },
            )
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   child: Icon(Icons.add),
      //   onPressed: () {
      //     FirebaseFirestore.instance.collection('Category').add({
      //       'name': "Sport",
      //       'type': "Expense",
      //     });
      //   },
      // ),
    );
  }
}

class AddIncome extends StatefulWidget {
  @override
  _AddIncomeState createState() => _AddIncomeState();
}

class _AddIncomeState extends State<AddIncome> {
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
          itemExtent: 80.0,
          itemCount: snapshot.data.documents.length,
          itemBuilder: (context, index) {
            DocumentSnapshot doc = snapshot.data.documents[index];
            return ListTile(
              title: Text(doc['name']),
              trailing: IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {
                  doc.reference.delete();
                },
              ),
            );
          },
        );
      },
    );
  }
}

class AddExpense extends StatefulWidget {
  @override
  _AddExpenseState createState() => _AddExpenseState();
}

class _AddExpenseState extends State<AddExpense> {
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
          itemExtent: 80.0,
          itemCount: snapshot.data.documents.length,
          itemBuilder: (context, index) {
            DocumentSnapshot doc = snapshot.data.documents[index];
            return ListTile(
              title: Text(doc['name']),
              trailing: IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {
                  doc.reference.delete();
                },
              ),
            );
          },
        );
      },
    );
  }
}

_showAlertDialog(BuildContext context, bool selectAdd) {
  showDialog(
    context: context,
    builder: (context) {
      final _formkey = GlobalKey<FormState>();
      return Form(
        key: _formkey,
        child: AlertDialog(
          title: Text('Add Category'),
          content: TextFormField(
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              hintText: 'Enter category name',
            ),
            onSaved: (newValue) async {
              String type;
              if (selectInc) {
                type = 'Income';
              } else {
                type = 'Expense';
              }
              CollectionReference category =
                  FirebaseFirestore.instance.collection('Category');
              await category.add({
                'name': newValue,
                'type': type,
              });
            },
          ),
          actions: [
            FlatButton(
              child: Text(
                "Cancel",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            FlatButton(
              child: Text(
                "Save",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              onPressed: () {
                _formkey.currentState.save();
                Navigator.pop(context);
              },
            ),
          ],
        ),
      );
    },
  );
}
