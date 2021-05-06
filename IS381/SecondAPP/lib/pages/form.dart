import 'package:flutter/material.dart';

class MySnackBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: MyCustomForm(),
      ),
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
  String _name;
  String _province;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Form Example"),
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
                    border: OutlineInputBorder(),
                    hintText: "enter username",
                    labelText: "username"
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter username';
                    }
                    this._name = value;
                    return null;
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: TextFormField(
                  obscureText: hidePassword??=true,  //if hidePassword=null => hidePassword=true
                  decoration: InputDecoration(
                    hintText: "enter password", 
                    labelText: "password",
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
                  onSaved: (value) {
                    _province = value;
                  }
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: TextFormField(
                  obscureText: hidePassword??=true,  //if hidePassword=null => hidePassword=true
                  decoration: InputDecoration(
                    hintText: "confirm password", 
                    labelText: "confirm password",
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please confirm password';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _province = value;
                  }
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 16.0, 
                  horizontal: 10.0
                ),
                child: RaisedButton(
                  onPressed: () {
                    String message = "Please enter all box";
                    if (_formKey.currentState.validate()) {
                      _formKey.currentState.save();
                      message = 'Processing for $_name';
                    }
                    Scaffold.of(context).showSnackBar(
                      SnackBar(
                        content: Text(message),
                      ),
                    );
                  },
                  child: Text('Submit'),
                ),
              ),
            ],
          ),
        )
      )
    );
  }
}
