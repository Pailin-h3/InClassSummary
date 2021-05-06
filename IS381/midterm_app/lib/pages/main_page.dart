import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:midterm_app/pages/form.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MID"),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.all(20.0),
            child: Consumer<RegisterFormModel>(
              builder: (context, form, child){
                String name = form.username;
                return Text("$name");
              }
            ),
          ),
        ]
      ),
      body: OrientationBuilder(
        builder: (context, orientation){
          return GridView.builder(
            itemCount: directions.length,
             gridDelegate:
                new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: orientation == Orientation.portrait ? 2 : 4),
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: EdgeInsets.all(10.0),
                child: new RaisedButton(
                  child: new GridTile(
                    footer: Center(child: new Text(directions[index].name)),
                    child: new Icon(directions[index].icon),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, directions[index].route);
                  },
                ),
              );
            },
          );
        }
      ),
      // Consumer<SaveUserModel>(
      //   builder: (context, form, child){
      //     if(form.name!=null){
      //       String name = form.name;
      //       Scaffold.of(context).showSnackBar(
      //         SnackBar(
      //           content: Text("Welcome $name"),
      //         ),
      //       );
      //       return null;
      //     }
      //     return null;
      //   }
      // ),
    );  
  }
}

class Direction {
  Direction({this.route,this.name,this.icon});
  String route;
  String name;
  IconData icon;
}

List<Direction> directions = <Direction>[
  Direction(route: "/form", name: "Create Account", icon: Icons.account_box),
  Direction(route: "/grid", name: "Grid Build", icon: Icons.grid_on),
  Direction(route: "/blank", name: "Blank Page", icon: Icons.restore_page),
  Direction(route: "/blank", name: "Test", icon: Icons.description),
  Direction(route: "/blank", name: "balance", icon: Icons.account_balance_wallet),
  Direction(route: "/blank", name: "contact us", icon: Icons.contacts),
];
