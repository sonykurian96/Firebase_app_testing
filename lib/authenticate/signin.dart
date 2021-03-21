import 'package:flutter/material.dart';
import 'package:voting_app/services/auth.dart';

class SignIn extends StatefulWidget {

  final Function togglePage;
  SignIn({this.togglePage});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();

  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[100],
      appBar: AppBar(
        title: Text("Welcome to Voting App"),
        backgroundColor: Colors.orange[400],
        actions: [
          FlatButton.icon(
              onPressed: () {
                print("sign in button pressed");
                widget.togglePage();
              },
              icon: Icon(Icons.person,color: Colors.black,),
              label: Text("Register")
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20,horizontal: 50),
        child: Form(
          child: Column(
            children: [
              TextFormField(
                onChanged: (value){
                  setState(() {
                    email = value;
                  });
                },
              ),
              SizedBox(height: 10,),
              TextFormField(
                obscureText: true,
                onChanged: (value){
                  setState(() {
                    password = value;
                  });
                },
              ),
              SizedBox(height: 20,),
              RaisedButton(
                color: Colors.pink[400],
                child: Text("Sign In"),
                  onPressed: () async{
                    print(email);
                    print(password);
                  }
              )
            ],
          ),
        )
      ),
    );
  }
}

// RaisedButton(
// child: Text("Sign in anonymously"),
// onPressed: () async{
// print("ok something missing");
// dynamic _result = await _auth.signInAnon();
// if(_result==null)
// print("some problem");
// else
// print("signed in");
// print(_result.uid);
// },
// ),
