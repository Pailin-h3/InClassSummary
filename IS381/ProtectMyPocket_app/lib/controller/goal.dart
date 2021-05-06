import 'dart:async';
import 'package:ProtectMyPocket_app/models/setgoal_model.dart';
import 'package:ProtectMyPocket_app/services/goal_service.dart';

class GoalController {
  final GoalService service;
  List<Goal> goals;

  StreamController<bool> onSynceStreamController = StreamController();
  Stream<bool> get onSync => onSynceStreamController.stream;

  GoalController(this.service);

  Future<List<Goal>> fetchGoals() async{
    onSynceStreamController.add(true);
    goals = await service.getGoals();
    onSynceStreamController.add(false);
    return goals;
  }

  void addGoals(Goal goal) {
    service.addGoals(goal);
  }
}