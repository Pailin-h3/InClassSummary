import 'package:SecondAPP/controller/todo.dart';
import 'package:SecondAPP/services/http_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:SecondAPP/pages/listview.dart';
import 'package:SecondAPP/pages/form.dart';
import 'package:SecondAPP/pages/todo_page.dart';

void main() async{
  // Service service = HttpService();
  Service service = FirebaseService();
  var controller = TodoController(service);

  runApp(MyApp(controller: controller));
}

class MyApp extends StatelessWidget {
  final TodoController controller;
  MyApp({Key key,this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
// set routes
      initialRoute: "/todo",
      routes: {
        "/": (context) => MyHomePage(title: "Pailin APP"),
        "/appbar": (context) => BasicAppBarExample(title: "AppBar"),
        "/longlist": (context) => ListViewExample(),
        "/form": (context) => MySnackBar(),
        "/todo": (context) => TodoPage(controller: controller),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  String _txtbutton = "Avilable";
  var _buttonColor = Colors.green;

  void _changTextButton() {
    setState(() {
      if (_txtbutton == "Disable") {
        _txtbutton = "Avilable";
        _buttonColor = Colors.green;
      } else {
        _txtbutton = "Disable";
        _buttonColor = Colors.red;
      }
    });
  }

  void _blankFunction() {}

  // void _incrementCounter() {
  //   setState(() {
  //     _counter++;
  //   });
  // }

  // void _decrementCounter() {
  //   setState(() {
  //     _counter--;
  //   });
  // }

  // void _resetCounter() {
  //   setState(() {
  //     _counter = 0;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          FlatButton(
            child: Text("AppBar"),
            onPressed: () {
              Navigator.pushNamed(context, "/appbar");
            },
          ),
          FlatButton(
            child: Text("ListVtew"),
            onPressed: () {
              Navigator.pushNamed(context, "/longlist");
            },
          ),
// can push like this if wanna send data to next page
          FlatButton(
            child: Text("form"),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MyCustomForm(/* send data here */),
                ),
              );
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('assets/counter_icon.png'),
            Text(
              'Counter:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                RaisedButton(
                  onPressed: _changTextButton,
                  child: Text(
                    _txtbutton,
                  ),
                  color: _buttonColor,
                ),
                PanicButton(
                  onPressed: _blankFunction,
                  display: Text(
                    "POOM",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
            Card(
                child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Text("Hello World!!"),
            )),
          ],
        ),
      ),
      // floatingActionButton: Stack(
      //   children: <Widget>[
      //     Positioned(
      //       bottom: 10.0,
      //       right: 10.0,
      //       child: FloatingActionButton(
      //         onPressed: () {
      //           _incrementCounter();
      //         },
      //         child: Icon(Icons.add),
      //       ),
      //     ),
      //     Positioned(
      //       bottom: 10.0,
      //       right: 160.0,
      //       child: FloatingActionButton(
      //         onPressed: () {
      //           _decrementCounter();
      //         },
      //         child: Icon(Icons.remove),
      //       ),
      //     ),
      //     Positioned(
      //       bottom: 10.0,
      //       right: 80.0,
      //       child: FloatingActionButton(
      //         onPressed: () {
      //           _resetCounter();
      //         },
      //         child: Icon(Icons.refresh),
      //       ),
      //     ),
      //   ],
      // ),
    );
  }
}

class PanicButton extends StatelessWidget {
  final Widget display;
  final VoidCallback onPressed;

  PanicButton({this.display, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      color: Colors.red,
      child: display,
      onPressed: onPressed,
    );
  }
}

// Create New Scaffold
class BasicAppBarExample extends StatefulWidget {
  BasicAppBarExample({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _BasicAppBarExampleState createState() => _BasicAppBarExampleState();
}

class _BasicAppBarExampleState extends State<BasicAppBarExample> {
  Choice _selectedChoice = choices[0];

  void _select(Choice choice) {
    setState(() {
      _selectedChoice = choice;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          IconButton(
            icon: Icon(choices[0].icon),
            onPressed: () {
              _select(choices[0]);
            },
          ),
          IconButton(
            icon: Icon(choices[1].icon),
            onPressed: () {
              _select(choices[1]);
            },
          ),
          PopupMenuButton<Choice>(
            onSelected: _select,
            itemBuilder: (BuildContext context) {
              return choices.skip(2).map((Choice choice) {
                return PopupMenuItem<Choice>(
                  value: choice,
                  child: Text(choice.title),
                );
              }).toList();
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ChoiceCard(choice: _selectedChoice),
      ),
    );
  }
}

class Choice {
  const Choice({this.title, this.icon});

  final String title;
  final IconData icon;
}

const List<Choice> choices = const <Choice>[
  const Choice(title: 'Car', icon: Icons.directions_car),
  const Choice(title: 'Bicycle', icon: Icons.directions_bike),
  const Choice(title: 'Boat', icon: Icons.directions_boat),
  const Choice(title: 'Bus', icon: Icons.directions_bus),
  const Choice(title: 'Train', icon: Icons.directions_railway),
  const Choice(title: 'Walk', icon: Icons.directions_walk),
];

class ChoiceCard extends StatelessWidget {
  const ChoiceCard({Key key, this.choice}) : super(key: key);

  final Choice choice;

  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = Theme.of(context).textTheme.headline4;
    return Card(
      color: Colors.white,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(choice.icon, size: 128.0, color: textStyle.color),
            Text(choice.title, style: textStyle),
          ],
        ),
      ),
    );
  }
}
