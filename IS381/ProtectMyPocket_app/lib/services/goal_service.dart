import 'package:ProtectMyPocket_app/models/setgoal_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:convert';

class GoalService {
  Future<List<Goal>> getGoals() async{
    QuerySnapshot snapshot =  await FirebaseFirestore.instance.collection('SetGoal').get();
    AllGoals allgoals = AllGoals.fromSnapshot(snapshot);
    var goals = allgoals.goals;
    print("Debug ${goals.length}");
    goals.sort((a, b) => a.time.compareTo(b.time));
    return goals;
  }

  void addGoals(Goal g) async{
    CollectionReference goals = FirebaseFirestore.instance.collection('SetGoal');
    await goals.add({
      'Goal' : g.goal,
      'Amount' : g.amount,
      'Saved' : 0 ,
      'In Time' : g.time
    })
    .then((value) => print("Goal Added"))
    .catchError((error) => print("Failed to add goal: $error"));
  }
}