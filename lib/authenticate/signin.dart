import 'package:flutter/material.dart';
import 'package:voting_app/constants.dart';
import 'package:voting_app/services/auth.dart';

class SignIn extends StatefulWidget {

  final Function togglePage;
  SignIn({this.togglePage});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';
  String error = '';

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
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: textInputDecoration.copyWith(hintText: "Email"),
                validator: (value) => value.isEmpty ? "Enter email":null,
                onChanged: (value){
                  setState(() {
                    email = value;
                  });
                },
              ),
              SizedBox(height: 10,),
              TextFormField(
                decoration: textInputDecoration.copyWith(hintText: "Password"),
                validator: (value) => value.length < 7 ? "Enter password +7 char":null,
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
                    if(_formKey.currentState.validate()){
                      print("valid");
                      dynamic result = await _auth.signInWithEmailAndPassword(email, password);
                      if(result == null){
                        setState(() {
                          error = "Could not signIn";
                        });
                      }
                    }
                  }
              ),
              SizedBox(height: 12,),
              Text(error, style: TextStyle(fontSize: 20,color: Colors.red),)
            ],
          ),
        )
      ),
    );
  }
}

