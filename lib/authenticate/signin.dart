import 'package:flutter/material.dart';
import 'package:voting_app/services/auth.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[100],
      appBar: AppBar(
        title: Text("Welcome to Voting App"),
        backgroundColor: Colors.orange[400],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20,horizontal: 50),
        child: RaisedButton(
          child: Text("Sign in anonymously"),
          onPressed: () async{
            dynamic _result = await _auth.signInAnon();
            if(_result==null)
              print("some problem");
            else
              print("signed in");
              print(_result.uid);
          },
        ),
      ),
    );
  }
}
