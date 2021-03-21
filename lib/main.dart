import 'package:flutter/material.dart';
import 'package:voting_app/wrapper.dart';
import 'package:provider/provider.dart';
import 'services/auth.dart';
import 'models/model.dart';

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
