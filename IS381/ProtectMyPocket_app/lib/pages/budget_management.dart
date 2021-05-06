import 'package:ProtectMyPocket_app/controller/goal.dart';
import 'package:ProtectMyPocket_app/models/setgoal_model.dart';
import 'package:ProtectMyPocket_app/services/goal_service.dart';
import 'package:flutter/material.dart';
import 'package:ProtectMyPocket_app/pages/set_goal.dart';

class BudgetManagementPage extends StatefulWidget {
  static GoalService goalService = GoalService();
  GoalController goalController = GoalController(goalService);

  @override
  _BudgetManagementPageState createState() => _BudgetManagementPageState();
}

bool selectFinished = false;

class _BudgetManagementPageState extends State<BudgetManagementPage> {
  // List<Goal> goals;
  // bool goalIsLoading = false;
  
  // void initState(){
  //   super.initState();
  //   widget.goalController.onSync.listen(
  //     (bool synceState) => setState((){
  //       goalIsLoading = synceState;
  //     })
  //   );
  // }
  // void _getTransactions() async{
  //   var newGoals = await widget.goalController.fetchGoals();
  //   setState(() => goals = newGoals);
  // }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(25, 10, 0, 0),
          child: Row(
            children: [
              Card(
                  child: InkWell(
                      splashColor: Theme.of(context).accentColor,
                      onTap: () {
                        setState(() {
                          selectFinished = false;
                        });
                      },
                      child: Container(
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(35, 15, 35, 15),
                          child: Text("Doing"),
                        ),
                      ))),
              Card(
                  child: InkWell(
                      splashColor: Theme.of(context).accentColor,
                      onTap: () {
                        setState(() {
                          selectFinished = true;
                        });
                      },
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(35, 15, 35, 15),
                        child: Text("Successful"),
                      ))),
              IconButton(
                icon: Icon(Icons.event_note),
                iconSize: 40,
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SetGoal(goalController: widget.goalController)));
                },
              ),
            ],
          ),
        ),
        Expanded(
          flex: 8,
          child: selectFinished ? FinishedGoal() : DoingGoal(goalController: widget.goalController,),
        ),
      ],
    );
  }
}

class DoingGoal extends StatefulWidget {
  final GoalController goalController;
  const DoingGoal({Key key, this.goalController}) : super(key: key);

  @override
  _DoingGoalState createState() => _DoingGoalState();
}

class _DoingGoalState extends State<DoingGoal> {
  List<Goal> goals;
  bool goalIsLoading = false;
  
  void initState(){
    super.initState();
    widget.goalController.onSync.listen(
      (bool synceState) => setState((){
        goalIsLoading = synceState;
      })
    );
  }
  void _getGoals() async{
    var newGoals = await widget.goalController.fetchGoals();
    setState(() => goals = newGoals);
  }

  @override
  Widget build(BuildContext context) {
    // if(goalIsLoading) return Center(child: CircularProgressIndicator());
    // else 
    return ListView.builder(
      itemCount: goals!=null? goals.length : 1,
      itemBuilder: (BuildContext buildContext, int index) {
        if(goals!=null){
          double percentage = goals[index].saved/goals[index].amount;
          return Padding(
            padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: Card(
              child: Row(
                children: [
                  Container(
                      width: 80,
                      height: 50,
                      child: Center(child: Text(goals[index].goal))),
                  Container(
                    width: 160,
                    height: 50,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                      child: LinearProgressIndicator(
                        backgroundColor: Colors.grey,
                        valueColor: AlwaysStoppedAnimation<Color>(
                            Theme.of(context).accentColor),
                        value: percentage,
                        minHeight: 20,
                      ),
                    ),
                  ),
                  Container(
                      width: 80,
                      height: 50,
                      child: Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                              "${(percentage * 100).toStringAsFixed(2)} %"))),
                ],
              ),
            ),
          );
        }else{
          _getGoals();
          return Text("Loading...");
        }
      },
      // itemCount: doinggoals.length,
      // itemBuilder: (context, index){
      //   double percentage = doinggoals[index].savedamount/doinggoals[index].goalamount;
      //   return Padding(
      //     padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
      //     child: Card(
      //       child: Row(
      //         children: [
      //           Container(
      //             width: 80,
      //             height: 50,
      //             child: Center(child: Text("${doinggoals[index].savefor}"))
      //           ),
      //           Container(
      //             width: 160,
      //             height: 50,
      //             child: Padding(
      //               padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
      //               child: LinearProgressIndicator(
      //                 backgroundColor: Colors.grey,
      //                 valueColor: AlwaysStoppedAnimation<Color>(Theme.of(context).accentColor),
      //                 value: percentage,
      //                 minHeight: 20,
      //               ),
      //             ),
      //           ),
      //           Container(
      //             width: 80,
      //             height: 50,
      //             child: Align(
      //               alignment: Alignment.centerRight,
      //               child: Text("${(percentage*100).toStringAsFixed(2)} %")
      //             )
      //           ),
      //         ],
      //       ),
      //     ),
      //   );
      // }
    );
  }
}

class FinishedGoal extends StatefulWidget {
  @override
  _FinishedGoalState createState() => _FinishedGoalState();
}

class _FinishedGoalState extends State<FinishedGoal> {
  @override
  Widget build(BuildContext context) {
    return Text("Didnt done yet");
    // ListView.builder(
    //     itemCount: finishedgoals.length,
    //     itemBuilder: (context, index) {
    //       double percentage = finishedgoals[index].savedamount /
    //           finishedgoals[index].goalamount;
    //       return Padding(
    //         padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
    //         child: Card(
    //           child: Row(
    //             children: [
    //               Container(
    //                   width: 80,
    //                   height: 50,
    //                   child: Center(
    //                       child: Text("${finishedgoals[index].savefor}"))),
    //               Container(
    //                 width: 160,
    //                 height: 50,
    //                 child: Padding(
    //                   padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
    //                   child: LinearProgressIndicator(
    //                     backgroundColor: Colors.grey,
    //                     valueColor: AlwaysStoppedAnimation<Color>(
    //                         Theme.of(context).accentColor),
    //                     value: percentage,
    //                     minHeight: 20,
    //                   ),
    //                 ),
    //               ),
    //               Container(
    //                   width: 80,
    //                   height: 50,
    //                   child: Align(
    //                       alignment: Alignment.centerRight,
    //                       child: Text(
    //                           "${(percentage * 100).toStringAsFixed(2)} %"))),
    //             ],
    //           ),
    //         ),
    //       );
        // });
  }
}
