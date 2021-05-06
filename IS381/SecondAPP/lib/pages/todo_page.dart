import 'package:SecondAPP/models/todos_model.dart';
import 'package:SecondAPP/controller/todo.dart';
import 'package:flutter/material.dart';

class TodoPage extends StatefulWidget{
  final TodoController controller;
  TodoPage({Key key,this.controller}) : super(key: key);

  @override
  _TodoPageState createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  List<Todo> todos;
  bool isLoading = false;

  void initState(){
    super.initState();
    widget.controller.onSync.listen(
      (bool synceState) => setState((){
        isLoading = synceState;
      })
    );
  }
  void _getTodos() async{
    var newTodos = await widget.controller.fetchTodos();
    setState(() => todos = newTodos);
  }
  // void _updateTodo(Todo todo, bool val) async{
  //   setState(() {
  //     todo.completed = val;
  //     widget.controller.service.updateTodo(todo);
  //   });
  // }

  Widget get body => isLoading? 
    CircularProgressIndicator()
    :ListView.builder(
      itemCount: todos!=null? todos.length : 1,
      itemBuilder: (ctx, idx){
        if(todos!=null){
          return CheckboxListTile(
            title: Text(todos[idx].title),
            value: todos[idx].completed, 
            onChanged: (bool val) {
              setState(() {
                todos[idx].completed = val;
                widget.controller.service.updateTodo(todos[idx]);
              });
            }
            // => _updateTodo(todos[idx], val),
          );
        }else{
          return Text("Tap button to fecth todos");
        }
      },
    );


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HTTP Todos"),
      ),
      body: Center(child: body),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _getTodos(),
        child: Icon(Icons.add),
      ),
    );
  }
}