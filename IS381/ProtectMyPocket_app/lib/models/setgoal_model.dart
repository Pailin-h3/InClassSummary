import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Goal {
  String goal;
  int amount;
  int saved;
  DateTime time;

  Goal(this.goal, this.amount, this.saved, this.time);

  factory Goal.fromJson(Map<String, dynamic> json){
    return Goal(
      json['Goal'] as String,
      json['Amount'] as int,
      json['Saved'] as int,
      json['In Time'].toDate() as DateTime
    );
  }
}

class AllGoals {
  final List<Goal> goals;

  AllGoals(this.goals);

  factory AllGoals.fromSnapshot(QuerySnapshot qs){
    List<Goal> goals = qs.docs.map((DocumentSnapshot ds) {
      return Goal.fromJson(ds.data());
    }).toList();
    return AllGoals(goals);
  }
}