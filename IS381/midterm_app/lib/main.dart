import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:midterm_app/pages/blankPage.dart';
import 'package:midterm_app/pages/form.dart';
import 'package:midterm_app/pages/main_page.dart';
import 'package:midterm_app/pages/grid_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MultiProvider(  //ChangeNotifierProvider
      providers: [
        ChangeNotifierProvider(create: (context) => RegisterFormModel()),
        Provider(create: (context) => SaveUserModel()),
      ],  //Notifier(Sender) here
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          // visualDensity: VisualDensity.adaptivePlatformDensity,
          brightness: Brightness.light,
          primaryColor: Colors.lightBlue[800],
          accentColor: Colors.green[300],
        ),
        initialRoute: "/",
        routes: {
          "/": (context) => MainPage(),
          // "/appbar": (context) => BasicAppBarExample(title: "AppBar"),
          "/blank": (context) => BlankPage(),
          "/form": (context) => MyFormPage(),
          "/grid": (context) => GridViewExample(),
        },
      ),
    );
  }
}
