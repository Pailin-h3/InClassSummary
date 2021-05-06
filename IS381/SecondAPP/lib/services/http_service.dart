import 'package:SecondAPP/models/todos_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:http/http.dart';
import 'dart:convert';

abstract class Service{
  Future<List<Todo>> getTodos();
  Future<Todo> updateTodo(Todo todo);
}

class FirebaseService implements Service{
  @override
  Future<List<Todo>> getTodos() async{
    QuerySnapshot snapshot =  await Firestore.instance.collection('todos').getDocuments();
    AllTodos todos = AllTodos.fromSnapshot(snapshot);
    return todos.todos;
  }

  @override
  Future<Todo> updateTodo(Todo todo) async{
    await Firestore.instance.collection('todos').document(todo.firebaseId).updateData({
      'completed' : todo.completed,
    });
    return todo;
  }

}

class HttpService implements Service{
  Client client = Client();

  Future<List<Todo>> getTodos() async{
    final response = await client.get(
      'https://jsonplaceholder.typicode.com/todos'
    );

    if(response.statusCode == 200){
      var all = AllTodos.fromJson(
        json.decode(response.body),
      );
      return all.todos;
    }else{
      throw Exception('Failed to load Todos');
    }
  }

  @override
  Future<Todo> updateTodo(Todo todo) {
    throw UnimplementedError();
  }
}