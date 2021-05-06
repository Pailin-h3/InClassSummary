import 'package:ProtectMyPocket_app/controller/goal.dart';
import 'package:ProtectMyPocket_app/models/setgoal_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class SetGoal extends StatefulWidget {
  SetGoal({Key key, this.title, this.goalController}) : super(key: key);
  final String title;
  final GoalController goalController;

  @override
  _SetGoalState createState() => _SetGoalState();
}

class _SetGoalState extends State<SetGoal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Set Goal'),
      ),
      body: SetGoalForm(goalController: widget.goalController,),
    );
  }
}

class SetGoalForm extends StatefulWidget {
  final GoalController goalController;

  const SetGoalForm({Key key, this.goalController}) : super(key: key);


  @override
  _SetGoalFormState createState() => _SetGoalFormState();
}

class _SetGoalFormState extends State<SetGoalForm> {
  final _goalFormKey = GlobalKey<FormState>();
  String dateHintText = "pick up date";

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _goalFormKey,
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(
                left: 20.0,
                top: 40.0,
                right: 20.0,
              ),
              color: Colors.blueGrey[100],
              padding: EdgeInsets.symmetric(),
              height: 80,
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
                              child: Text("Goal",
                                  style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold))),
                        ],
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                            padding: EdgeInsets.all(4),
                            child: Text(":",
                                style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold))),
                      ],
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextFormField(
                            onSaved: (String string) {
                              var model = context.read<SetGoalFormModel>();
                              model.goal = string;
                            },
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Enter your goal',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                left: 20.0,
                right: 20.0,
              ),
              color: Colors.blueGrey[100],
              padding: EdgeInsets.symmetric(),
              height: 80,
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
                              child: Text("Amount",
                                  style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold))),
                        ],
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                            padding: EdgeInsets.all(4),
                            child: Text(":",
                                style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold))),
                      ],
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextFormField(
                            onSaved: (a) {
                              var model = context.read<SetGoalFormModel>();
                              model.amount = int.parse(a);
                            },
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Enter your amount',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Container(
            //   margin: EdgeInsets.only(
            //     left: 20.0,
            //     right: 20.0,
            //   ),
            //   color: Colors.blueGrey[100],
            //   padding: EdgeInsets.symmetric(),
            //   height: 80,
            //   child: Padding(
            //     padding: EdgeInsets.all(10),
            //     child: Row(
            //       children: [
            //         Expanded(
            //           child: Column(
            //             mainAxisAlignment: MainAxisAlignment.center,
            //             children: [
            //               Padding(
            //                   padding: EdgeInsets.all(4),
            //                   child: Text("Saved",
            //                       style: TextStyle(
            //                           fontSize: 20.0,
            //                           fontWeight: FontWeight.bold))),
            //             ],
            //           ),
            //         ),
            //         Column(
            //           mainAxisAlignment: MainAxisAlignment.center,
            //           children: [
            //             Padding(
            //                 padding: EdgeInsets.all(4),
            //                 child: Text(":",
            //                     style: TextStyle(
            //                         fontSize: 20.0,
            //                         fontWeight: FontWeight.bold))),
            //           ],
            //         ),
            //         Expanded(
            //           child: Column(
            //             mainAxisAlignment: MainAxisAlignment.center,
            //             children: [
            //               TextFormField(
            //                 onSaved: (s) {
            //                   var model = context.read<SetGoalFormModel>();
            //                   model.saved = int.parse(s);
            //                 },
            //                 inputFormatters: <TextInputFormatter>[
            //                   FilteringTextInputFormatter.digitsOnly
            //                 ],
            //                 decoration: InputDecoration(
            //                   border: OutlineInputBorder(),
            //                   hintText: 'Enter your saved',
            //                 ),
            //               ),
            //             ],
            //           ),
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
            Container(
              margin: EdgeInsets.only(
                left: 20.0,
                bottom: 40.0,
                right: 20.0,
              ),
              color: Colors.blueGrey[100],
              padding: EdgeInsets.symmetric(),
              height: 80,
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
                              child: Text("In Time",
                                  style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold))),
                        ],
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                            padding: EdgeInsets.all(4),
                            child: Text(":",
                                style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold))),
                      ],
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextFormField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: dateHintText,
                            ),
                            onTap: () async {
                              DateTime date = DateTime.now();
                              FocusScope.of(context)
                                  .requestFocus(new FocusNode());
                              date = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(1900),
                                  lastDate: DateTime(2100));
                              setState(() {
                                dateHintText =
                                    date.toIso8601String().substring(0, 10);
                              });
                              var model = context.read<SetGoalFormModel>();
                              model.time = date;
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            RaisedButton(
              color: Colors.red,
              child: Text(
                'SAVE',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                _goalFormKey.currentState.save();
                var model = context.read<SetGoalFormModel>();
                widget.goalController.addGoals(Goal(
                  model.goal,
                  model.amount,
                  0,
                  model.time
                ));
                model.saveGoal();
                // await insertValueToFireStore();
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  // Future<void> insertValueToFireStore() async {
  //   FirebaseFirestore firestore = FirebaseFirestore.instance;

  //   Map<String, dynamic> map = Map();
  //   map['Goal'] = goal;
  //   map['Amount'] = amount;
  //   map['In Time'] = time;
  //   map['Saved'] = saved;

  //   await firestore.collection('SetGoal').doc().set(map).then((value) {
  //     // MaterialPageRoute route = MaterialPageRoute(
  //     //   builder: (value) => BudgetManagementPage(),
  //     // );
  //     // Navigator.of(context).pushAndRemoveUntil(route, (value) => false);
  //   });
  // }
}

class SetGoalFormModel extends ChangeNotifier {
  String goal;
  int amount;
  int saved;
  DateTime time;

  void saveGoal(){
    notifyListeners();
  }
}