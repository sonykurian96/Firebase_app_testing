import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:voting_app/home/brewlist.dart';
import 'package:voting_app/services/auth.dart';
import 'package:voting_app/services/database.dart';

class Home extends StatelessWidget {

  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return StreamProvider<QuerySnapshot>.value(
      value: DataBaseService().brews,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.brown[300],
            title: Text("Home Screen"),
          actions: [
            FlatButton.icon(
                onPressed: () async{
                  await _auth.signOut();
                  print("pressed");
                },
                icon: Icon(Icons.logout,color: Colors.black,),
                label: Text("Log out")
            )
          ],
        ),
        body: BrewList(),
      ),
    );
  }
}
