import 'package:ProtectMyPocket_app/models/logIn_model.dart';
import 'package:ProtectMyPocket_app/pages/set_goal.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ProtectMyPocket_app/pages/add_transaction.dart';
import 'package:ProtectMyPocket_app/pages/home_dummy.dart';

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
          // OngsaService service = OngsaFireBaseService();
          // AccountController controller = AccountController(service);
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
    final String title = 'Protect My Pocket';

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => TransactionFormModel()),
        // ChangeNotifierProvider(create: (context) => GoalModel()),
        ChangeNotifierProvider(create: (context) => SetGoalFormModel()),
        ChangeNotifierProvider(create: (context) => RegisterFormModel()),
        ChangeNotifierProvider(create: (context) => LoginFormModel()),
      ],
      child: MaterialApp(
        title: title,
        theme: ThemeData(
          primarySwatch: Colors.amber,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        initialRoute: '/',
        routes: {
          "/": (context) => HomePage1(title: 'Home'),
        }
      ),
    );
  }
}
