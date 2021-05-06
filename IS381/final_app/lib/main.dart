import 'package:final_app/operator/calculator.dart';
import 'package:final_app/operator/memory.dart';
import 'package:final_app/pages/history.dart';
import 'package:final_app/pages/home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(FireBaseInitApp());
}


class FireBaseInitApp extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          print('Error');
        }
        if (snapshot.connectionState == ConnectionState.done) {
          return MyApp();
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => Operator()),
          ChangeNotifierProvider(create: (context) => Memory()),
          ChangeNotifierProvider(create: (context) => AllHistory()),
        ],
        child: MaterialApp(
        title: 'Final App',
        theme: ThemeData(
          primarySwatch: Colors.blueGrey,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          accentColor: Colors.blueGrey[50],
        ),
        home: MyHomePage(),
      ),
    );
  }
}


