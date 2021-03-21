import 'package:flutter/material.dart';
import 'package:voting_app/services/auth.dart';

class Register extends StatefulWidget {

  final Function togglePage;
  Register({this.togglePage});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

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
                print("pressed");
                widget.togglePage();
              },
              icon: Icon(Icons.person,color: Colors.black,),
              label: Text("SignIn")
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
                  validator: (value) => value.isEmpty ? "Enter email":null,
                  onChanged: (value){
                    setState(() {
                      email = value;
                    });
                  },
                ),
                SizedBox(height: 10,),
                TextFormField(
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
                    child: Text("Register"),
                    onPressed: () async{
                      if(_formKey.currentState.validate()){
                      print(email);
                      print(password);
                      }
                    }
                )
              ],
            ),
          )
      ),
    );
  }
}
