import 'package:ProtectMyPocket_app/models/logIn_model.dart';
import 'package:ProtectMyPocket_app/services/logIn_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _rememberMe = false;
  final _formkey = GlobalKey<FormState>();

  String email;
  String _password;

  @override
  Widget build(BuildContext context) {
    FirebaseAuth.instance.authStateChanges().listen((User user) {
      if (user == null) {
        print('User is currently signed out!');
      } else {
        print('User is signed in!');
      }
    });

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
          Container(
            height: double.infinity,
            child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric(
                horizontal: 40.0,
                vertical: 60.0,
              ),
              child: Form(
                key: _formkey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    // Text Log-In
                    Center(
                      child: Text(
                        'Log In',
                        style: TextStyle(
                          color: Colors.black87,
                          //fontFamily: 'OpenSans',
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 30.0),
                    // Build Email TextFormField
                    Text(
                      'Email',
                      style: TextStyle(color: Colors.black87, fontSize: 20.0),
                    ),
                    SizedBox(height: 10.0),
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
                            Icons.account_circle,
                            color: Colors.white,
                          ),
                          hintText: 'Enter your Email',
                          hintStyle: TextStyle(color: Colors.black54),
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter your Email';
                          }

                          return null;
                        },
                        onSaved: (value) {
                          context.read<LoginFormModel>().email = value;
                        },
                      ),
                    ),
                    SizedBox(height: 10.0),
                    // Build Password TextformField
                    Text(
                      'Password',
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'OpenSans',
                        fontSize: 20.0,
                      ),
                    ),
                    SizedBox(height: 10.0),
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
                          hintText: 'Enter your password',
                          hintStyle: TextStyle(color: Colors.black54),
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter your Password';
                          }

                          return null;
                        },
                        onSaved: (value) {
                          context.read<LoginFormModel>().password = value;
                        },
                      ),
                    ),
                    SizedBox(height: 10.0),
                    // Forgot password button
                    Container(
                      alignment: Alignment.centerRight,
                      child: FlatButton(
                        onPressed: () =>
                            print('Forgot Password Button Pressed'),
                        padding: EdgeInsets.only(right: 0.0),
                        child: Text(
                          'Forgot Password?',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'OpenSans',
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 5.0),
                    // Remember me Checkbox
                    Container(
                      height: 20.0,
                      child: Row(children: <Widget>[
                        Theme(
                          data: ThemeData(unselectedWidgetColor: Colors.black),
                          child: Checkbox(
                            value: _rememberMe,
                            checkColor: Colors.green,
                            activeColor: Colors.black,
                            onChanged: (value) {
                              setState(() {
                                _rememberMe = value;
                              });
                            },
                          ),
                        ),
                        Text(
                          'Remember me',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'OpenSans',
                          ),
                        ),
                      ]),
                    ),
                    SizedBox(height: 10.0),
                    // Login Button
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 25.0),
                      width: double.infinity,
                      child: RaisedButton(
                        elevation: 10.0,
                        onPressed: () async {
                          _formkey.currentState.save();
                          LoginService().login(
                            context,
                            context.read<LoginFormModel>().email,
                            context.read<LoginFormModel>().password,
                          );
                        },
                        padding: EdgeInsets.all(15.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        color: Colors.white,
                        child: Text(
                          'LOGIN',
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
                    SizedBox(height: 10.0),
                    // Login with Text
                    Center(
                      child: Column(
                        children: <Widget>[
                          Text(
                            '- OR -',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          SizedBox(height: 20.0),
                          Text(
                            'Log in with',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'OpenSans',
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Login with Social Button
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 30.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          //Facebook Button
                          GestureDetector(
                            onTap: () => print('Login with Facebook'),
                            child: Container(
                              height: 60.0,
                              width: 60.0,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black26,
                                    offset: Offset(0, 2),
                                    blurRadius: 6.0,
                                  ),
                                ],
                                image: DecorationImage(
                                  image: AssetImage('assets/facebook4.png'),
                                ),
                              ),
                            ),
                          ),
                          // Google Button
                          GestureDetector(
                            onTap: () => print('Login with Google'),
                            child: Container(
                              height: 60.0,
                              width: 60.0,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black26,
                                    offset: Offset(0, 2),
                                    blurRadius: 6.0,
                                  ),
                                ],
                                image: DecorationImage(
                                  image: AssetImage('assets/GOOGLE4.png'),
                                ),
                              ),
                            ),
                          ),
                          // Email Button
                          GestureDetector(
                            onTap: () => print('Login with Email'),
                            child: Container(
                              height: 60.0,
                              width: 60.0,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black26,
                                    offset: Offset(0, 2),
                                    blurRadius: 6.0,
                                  ),
                                ],
                                image: DecorationImage(
                                  image: AssetImage('assets/Email.jpg'),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10.0),
                    // Don\'t have an Acount?/Sign Up Text
                    Center(
                      child: GestureDetector(
                        onTap: () => print('Sign Up Button Pressed'),
                        child: RichText(
                          text: TextSpan(children: [
                            TextSpan(
                              text: 'Don\'t have an Acount?',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18.0,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            TextSpan(
                              text: 'Sign Up',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ]),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
