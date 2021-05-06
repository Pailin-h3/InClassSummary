import 'package:flutter/material.dart';

class SaveLoginModel extends ChangeNotifier {
  String email;

  void accountCreated(String name) {
    email = name;
    notifyListeners();
  }
}

class LoginFormModel extends ChangeNotifier {
  // Sender
  String _email;
  String _password;

  String get email => _email;
  set email(String value) {
    _email = value;
    notifyListeners();
  }

  String get password => _password;
  set password(String value) {
    _password = value;
    notifyListeners();
  }
}

class RegisterFormModel extends ChangeNotifier {
  //Sender
  String _email;
  String _password;
  String _country;

  String get email => _email;

  set email(String value) {
    _email = value;
    notifyListeners();
  }

  String get password => _password;

  set password(String value) {
    _password = value;
    notifyListeners();
  }

  String get country => _country;
  set country(String value) {
    _country = value;
    notifyListeners();
  }
}
