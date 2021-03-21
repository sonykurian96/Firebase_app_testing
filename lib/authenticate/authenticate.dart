import "package:flutter/material.dart";
import 'package:voting_app/authenticate/register.dart';
import 'package:voting_app/authenticate/signin.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {

  bool showSignIn = true;

  void togglePage(){
    setState(() {
      showSignIn = !showSignIn;
    });
  }

  @override
  Widget build(BuildContext context) {

    if(showSignIn)
     return SignIn(togglePage : togglePage);
    else{
      return Register(togglePage : togglePage);
    }
  }
}
