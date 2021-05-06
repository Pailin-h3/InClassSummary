import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginService {
  Future<void> login(BuildContext context, String email, String password) async {
    try {
      UserCredential userCredential =
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        await _showMyDialog(context, 'No user found for that email.');
        return;
      } else if (e.code == 'wrong-password') {
        await _showMyDialog(context, 'Wrong password provided for that user.');
        return;
      }
    }
    await _showMyDialog(context, 'Login successful');
    Navigator.of(context).pop();
  }

  Future<void> register(
      BuildContext context, String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        await _showMyDialog(context, 'The password provided is too weak.');
        return;
      } else if (e.code == 'email-already-in-use') {
        await _showMyDialog(
            context, 'The account already exists for that email.');
        return;
      }
    } catch (e) {
      print(e);
      await _showMyDialog(context, 'unknown error');
      return;
    }
    await _showMyDialog(context, 'Create complete!');
    Navigator.of(context).pop();
  }

  Future<void> _showMyDialog(BuildContext context, String message) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('AlertDialog Title'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(message),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
