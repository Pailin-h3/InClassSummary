import 'package:ProtectMyPocket_app/models/logIn_model.dart';
import 'package:ProtectMyPocket_app/services/logIn_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
//import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formkey = GlobalKey<FormState>();
  bool hidePassword;
  bool hideConfirmPassword;

  String _email;
  String _country;
  String _password;
  //String _confirmPassword;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Protect My Pocket'),
      ),
      body: Stack(
        children: <Widget>[
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFFFFF59D),
                  Color(0xFFFFF176),
                  Color(0xFFFFEE58),
                  Color(0xFFFDD835),
                ],
                stops: [0.1, 0.4, 0.7, 0.9],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                top: 16.0, bottom: 60.0, left: 16.0, right: 16.0),
            child: Container(
              height: double.infinity,
              child: SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                padding: EdgeInsets.symmetric(
                  horizontal: 40.0,
                  vertical: 30.0,
                ),
                child: Form(
                  key: _formkey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      // Sign Up Text
                      Center(
                        child: Text(
                          'Sign Up',
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(height: 30.0),
                      // Email Text
                      Text(
                        'Email',
                        style: TextStyle(color: Colors.black87, fontSize: 20),
                      ),
                      SizedBox(height: 10.0),
                      // Build Email TextFormField
                      Container(
                        alignment: Alignment.centerLeft,
                        decoration: new BoxDecoration(
                          color: Color(0xFFFFC107),
                          borderRadius: BorderRadius.circular(10.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 6.0,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                        height: 60.0,
                        child: TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          style: TextStyle(
                              color: Colors.white, fontFamily: 'OpenSans'),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.only(top: 14.0),
                            prefixIcon: Icon(
                              Icons.email,
                              color: Colors.white,
                            ),
                            hintText: 'Create your Email',
                            hintStyle: TextStyle(color: Colors.black54),
                          ),
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please enter your Email';
                            }

                            this._email = value;
                            print(this._email);
                            return null;
                          },
                          onSaved: (value) {
                            context.read<RegisterFormModel>().email = value;
                          },
                        ),
                      ),
                      SizedBox(height: 15.0),
                      // Country Text
                      Text(
                        'Country',
                        style: TextStyle(color: Colors.black87, fontSize: 20),
                      ),
                      SizedBox(height: 10.0),
                      // Build Country TextFormField
                      Container(
                        alignment: Alignment.centerLeft,
                        decoration: new BoxDecoration(
                          color: Color(0xFFFFC107),
                          borderRadius: BorderRadius.circular(10.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 6.0,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                        height: 60.0,
                        child: TextFormField(
                          keyboardType: TextInputType.text,
                          style: TextStyle(
                              color: Colors.white, fontFamily: 'OpenSans'),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.only(top: 14.0),
                            prefixIcon: Icon(
                              Icons.flag,
                              color: Colors.white,
                            ),
                            hintText: 'Enter your Country',
                            hintStyle: TextStyle(color: Colors.black54),
                          ),
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please enter your Counry';
                            }

                            this._country = value;
                            print(this._country);
                            return null;
                          },
                          onSaved: (value) {
                            context.read<RegisterFormModel>().country = value;
                          },
                        ),
                      ),
                      SizedBox(height: 15.0),
                      // Password Text
                      Text(
                        'Password',
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'OpenSans',
                          fontSize: 20.0,
                        ),
                      ),
                      SizedBox(height: 10.0),
                      // Build Password TextFormField
                      Container(
                        alignment: Alignment.centerLeft,
                        decoration: BoxDecoration(
                          color: Color(0xFFFFC107),
                          borderRadius: BorderRadius.circular(10.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 6.0,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                        height: 60.0,
                        child: TextFormField(
                          obscureText: true,
                          onSaved: (value) {
                            context.read<RegisterFormModel>().password = value;
                          },
                          style: TextStyle(
                              color: Colors.white, fontFamily: 'OpenSans'),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.only(top: 14.0),
                            prefixIcon: Icon(
                              Icons.lock,
                              color: Colors.white,
                            ),
                            hintText: 'Create your Password',
                            hintStyle: TextStyle(color: Colors.black54),
                            suffixIcon: IconButton(
                              icon: Icon(Icons.remove_red_eye),
                              onPressed: () {
                                setState(() {
                                  hidePassword = !hidePassword;
                                });
                              },
                            ),
                          ),
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please enter your Password';
                            }

                            // this._password = value;
                            // print(this._password);
                            return null;
                          },
                        ),
                      ),
                      SizedBox(height: 15.0),
                      // Confirm Password Text
                      Text(
                        'Confirm Password',
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'OpenSans',
                          fontSize: 20.0,
                        ),
                      ),
                      SizedBox(height: 10.0),
                      // Build Confirm Password TextFormField
                      Container(
                        alignment: Alignment.centerLeft,
                        decoration: BoxDecoration(
                          color: Color(0xFFFFC107),
                          borderRadius: BorderRadius.circular(10.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 6.0,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                        height: 60.0,
                        child: TextFormField(
                          obscureText: true,
                          style: TextStyle(
                              color: Colors.white, fontFamily: 'OpenSans'),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.only(top: 14.0),
                            prefixIcon: Icon(
                              Icons.lock,
                              color: Colors.white,
                            ),
                            hintText: 'Confirm your Password',
                            hintStyle: TextStyle(color: Colors.black54),
                            suffixIcon: IconButton(
                              icon: Icon(Icons.remove_red_eye),
                              onPressed: () {
                                setState(() {
                                  hideConfirmPassword = !hideConfirmPassword;
                                });
                              },
                            ),
                          ),
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please confirm your Password';
                            }

                            // this._password = value;
                            // print(this._password);
                            return null;
                          },
                          // onChanged: (value) {
                          //   _confirmPassword = value;
                          // },
                          // onSaved: (value) {
                          //   var model = context.read<RegisterFormModel>();
                          //   model.setConfirmPassword(value);
                          // },
                        ),
                      ),
                      SizedBox(height: 15.0),
                      // Build Register Button
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 25.0),
                        width: double.infinity,
                        child: RaisedButton(
                          elevation: 10.0,
                          onPressed: () async {
                            if (_formkey.currentState.validate()) {
                              _formkey.currentState.save();
                              LoginService().register(
                                context,
                                context.read<RegisterFormModel>().email,
                                context.read<RegisterFormModel>().password,
                              );
                            }
                          },
                          padding: EdgeInsets.all(15.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          color: Colors.white,
                          child: Text(
                            'REGISTER',
                            style: TextStyle(
                              color: Color(0xFF000000),
                              letterSpacing: 1.5,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'OpenSans',
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 15.0),
                      // Already Register? Log In
                      Center(
                        child: GestureDetector(
                          onTap: () => print('Register Button Pressed'),
                          child: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Already Register?',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                TextSpan(
                                  text: 'Log In',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
