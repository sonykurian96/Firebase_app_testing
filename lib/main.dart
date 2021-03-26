import 'package:flutter/material.dart';
import 'package:voting_app/wrapper.dart';
import 'package:provider/provider.dart';
import 'services/auth.dart';
import 'models/model.dart';


/*
    * continue from 2:15 timestamp of 19th video of flutter & firebase series
    * written on 26/03/2021 13:47
*/

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        home: Wrapper(),
      ),
    );
  }
}
