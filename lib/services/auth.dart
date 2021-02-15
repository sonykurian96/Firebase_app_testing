import 'package:firebase_auth/firebase_auth.dart';
import 'package:voting_app/models/model.dart';

class AuthService{
  final FirebaseAuth _auth = FirebaseAuth.instance;

  User _userFromFireBaseUser(FirebaseUser user)
  {
    return user!=null ? User(uid: user.uid) : null;
  }

// ......

  // Stream<User> get user{
  //   return _auth.onAuthStateChanged
  //      // .map((FirebaseUser user) => _userFromFireBaseUser(user));
  //   .map(_userFromFireBaseUser);
  // }


  Future signInAnon() async{
    try{
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      return _userFromFireBaseUser(user);
    }
    catch(e){
      print(e.toString());
      return null;
    }
}
}