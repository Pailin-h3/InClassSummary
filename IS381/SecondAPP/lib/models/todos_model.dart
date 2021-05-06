import 'package:cloud_firestore/cloud_firestore.dart';

class Todo {
  final int userId;
  final int id;
  final String title;
  bool completed;
  String firebaseId;

  Todo(this.userId,this.id,this.title,this.completed);

  factory Todo.fromJson(Map<String, dynamic> json){
    return Todo(
      json['userId'] as int,
      json['id'] as int,
      json['title'] as String,
      json['completed'] as bool,
    );
  }
}

class AllTodos {
  final List<Todo> todos;

  AllTodos(this.todos);

  factory AllTodos.fromJson(List<dynamic> json){
    List<Todo> todos = List<Todo>();
    todos = json.map((i) => Todo.fromJson(i)).toList();
    return AllTodos(todos);
  }
  factory AllTodos.fromSnapshot(QuerySnapshot qs){
    List<Todo> todos = qs.documents.map((DocumentSnapshot ds) {
      Todo todo = Todo.fromJson(ds.data);
      todo.firebaseId = ds.documentID;
      return todo;
    }).toList();
    return AllTodos(todos);
  }
}