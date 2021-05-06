import 'dart:async';
import 'package:SecondAPP/models/todos_model.dart';
import 'package:SecondAPP/services/http_service.dart';

class TodoController {
  final Service service;
  List<Todo> todos;

  StreamController<bool> onSynceStreamController = StreamController();
  Stream<bool> get onSync => onSynceStreamController.stream;

  TodoController(this.service);

  Future<List<Todo>> fetchTodos() async{
    onSynceStreamController.add(true);
    todos = await service.getTodos();
    onSynceStreamController.add(false);
    return todos;
  }
}