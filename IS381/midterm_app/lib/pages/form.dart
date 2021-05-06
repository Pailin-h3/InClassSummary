import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyFormPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MyCustomForm(),
    );
  }
}

class MyCustomForm extends StatefulWidget {
  MyCustomForm({Key key}) : super(key: key);

  @override
  _MyCustomFormState createState() => _MyCustomFormState();
}

class _MyCustomFormState extends State<MyCustomForm> {
  final _formKey = GlobalKey<FormState>();
  bool hidePassword;
  bool hideConfirmPassword;
  String _name;
  String _password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create Account"),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(10.0),
                  child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "enter username",
                    labelText: "Username"
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter username';
                    }
                    // this._name = value;
                    return null;
                  },
                  onSaved: (value) {
                    this._name = value;
                    var model = context.read<RegisterFormModel>();
                    model.setUsername(value);
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                  child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "",
                    labelText: "Fullname"
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter name';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    var model = context.read<RegisterFormModel>();
                    model.setFullname(value);
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                  child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "",
                    labelText: "Email"
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter email';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    var model = context.read<RegisterFormModel>();
                    model.setEmail(value);
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                  child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "",
                    labelText: "Career"
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter career';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    var model = context.read<RegisterFormModel>();
                    model.setCareer(value);
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: TextFormField(
                  obscureText: hidePassword??=true,  //if hidePassword=null => hidePassword=true
                  decoration: InputDecoration(
                    hintText: "enter password", 
                    labelText: "Password",
                    suffixIcon: IconButton(
                      icon: Icon(Icons.remove_red_eye),
                      onPressed: () {
                        setState(() {
                          hidePassword = !hidePassword;
                        });
                      }
                    ),
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter password';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    _password = value;
                  },
                  onSaved: (value){
                    var model = context.read<RegisterFormModel>();
                    model.setPassword(value);
                  }
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: TextFormField(
                  obscureText: hideConfirmPassword??=true,  //if hidePassword=null => hidePassword=true
                  decoration: InputDecoration(
                    hintText: "confirm password", 
                    labelText: "confirm password",
                    suffixIcon: IconButton(
                      icon: Icon(Icons.remove_red_eye),
                      onPressed: () {
                        setState(() {
                          hideConfirmPassword = !hideConfirmPassword;
                        });
                      }
                    ),
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please confirm password';
                    }
                    if(value!=_password){
                      return 'Password not Synce';
                    }
                    return null;
                  },
                ),
              ),
              // Padding(
              //   padding: EdgeInsets.all(10.0),
              //   child: Consumer<RegisterFormModel>(
              //     builder: (context, form, child){
              //       String name = form.username;
              //       return Text("$name");
              //     }
              //   ),  //Listenner
              // ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 16.0, 
                  horizontal: 10.0
                ),
                child: Consumer<RegisterFormModel>(
                  builder: (context, form, child){
                    return RaisedButton(
                      onPressed: () {
                        bool invalidInput = true;
                        String header = "Create Account Error";
                        String message = "Please enter all box";
                        if (_formKey.currentState.validate()) {
                          _formKey.currentState.save();
                          String username = form.username;
                          String fullname = form.fullname;
                          String email = form.email;
                          String career = form.career;
                          invalidInput = false;
                          header = 'Confirm Create Account';
                          message = 'Username : $username\nFullname: $fullname\nEmail: $email\nCareer: $career\n';
                          // Navigator.pop(context);
                        }
                        // Scaffold.of(context).showSnackBar(
                        //   SnackBar(
                        //     content: Text(message),
                        //   ),
                        // );
                        return showDialog(
                          context: context,
                          builder: (context){
                            return AlertDialog(
                              title: Text(header),
                              content: Text(message),
                              actions: <Widget>[
                                RaisedButton(
                                  child: Text('Undo'),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                                RaisedButton(
                                  child: Text('Confirm'),
                                  onPressed: invalidInput? null : () {
                                    Navigator.of(context).pop();
                                    Navigator.of(context).pop();
                                    // var model = context.read<SaveUserModel>();
                                    // model.accountCreated(_name);
                                  },
                                ),
                              ],
                            );
                          }
                        );
                      },
                      child: Text('Submit'),
                    );
                  }
                ),
              ),
            ],
          ),
        )
      )
    );
  }
}

class SaveUserModel extends ChangeNotifier {
  String name;
  void accountCreated(String v){
    name = v;
    notifyListeners();
  }
}

class RegisterFormModel extends ChangeNotifier {  //Sender
  String username;
  String fullname;
  String email;
  String career;
  String password;

  void setUsername(String name){
    username = name;
    notifyListeners();
  }
  void setFullname(String name){
    fullname = name;
    notifyListeners();
  }
  void setEmail(String v){
    email = v;
    notifyListeners();
  }
  void setCareer(String v){
    career = v;
    notifyListeners();
  }
  void setPassword(String pass){
    password = pass;
    notifyListeners();
  }

  // bool passwordConfirmed(String conpass){
  //   return password==conpass;
  // }
}
