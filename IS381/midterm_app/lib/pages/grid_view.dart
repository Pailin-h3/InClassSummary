import 'package:flutter/material.dart';

class GridViewExample extends StatefulWidget {
  @override
  _GridViewExampleState createState() => _GridViewExampleState();
}

class _GridViewExampleState extends State<GridViewExample> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Grid View"),
      ),
      body: OrientationBuilder(
        builder: (context, orientation){
          return GridView.builder(
            itemCount: items.length,
            gridDelegate:
                new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: orientation == Orientation.portrait ? 2 : 4),
            itemBuilder: (BuildContext context, int index) {
              return new RaisedButton(
                child: new GridTile(
                  footer: Center(child: new Text(items[index].name)),
                  child: new Icon(items[index].icon),
                ),
                onPressed: () {
                  // final snackBar = SnackBar(
                  //   content: Text('You Select ${items[index].name}'),
                  // );
                  // Scaffold.of(context).showSnackBar(snackBar);
                  return showDialog(
                    context: context,
                    builder: (context){
                        return AlertDialog(
                          content: Text('You Select ${items[index].name}'),
                        );
                      }
                  );
                },
              );
            },
          );
        }
      ),
    );
  }
}

class Item {
  Item({this.name,this.icon});
  String name;
  IconData icon;
}

List<Item> items = <Item>[
  Item(name: 'Form 1', icon: Icons.description),
  Item(name: 'Form 2', icon: Icons.description),
  Item(name: 'Form 3', icon: Icons.description),
  Item(name: 'Form 4', icon: Icons.description),
  Item(name: 'Form 5', icon: Icons.description),
  Item(name: 'Form 6', icon: Icons.description),
  Item(name: 'Form 7', icon: Icons.description),
  Item(name: 'Form 8', icon: Icons.description),
  Item(name: 'Form 9', icon: Icons.description),
  Item(name: 'Form 10', icon: Icons.description),
];