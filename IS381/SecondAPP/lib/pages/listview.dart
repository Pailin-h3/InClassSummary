import 'package:flutter/material.dart';

class ListViewExample extends StatefulWidget {
  ListViewExample({Key key}) : super(key: key);

  @override
  _ListViewExampleState createState() => _ListViewExampleState();
}

class _ListViewExampleState extends State<ListViewExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Listview Example"),
        ),
        body: ListView(
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.map),
              title: Text("Map"),
            ),
            ListTile(
              leading: Icon(Icons.photo_album),
              title: Text("Album"),
            ),
            ListTile(
              leading: Icon(Icons.phone),
              title: Text("Phone"),
            ),
          ],
        ));
  }
}
