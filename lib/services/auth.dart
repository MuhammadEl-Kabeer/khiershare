import 'package:finalproject/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // creates an user obj based on FirebaseUser
  User _userFromFirbaseUser(FirebaseUser user) {
    return user != null ? User(uid: user.uid) : null;
  }

  //Auth change user stream
  Stream<User> get user {
    return _auth.onAuthStateChanged
        //.map((FirebaseUser user)=>_userFromFirbaseUser(user));
        .map(_userFromFirbaseUser);
  }

  // sign in in anon
  Future siginInAnon() async {
    try {
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      return _userFromFirbaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // sign in withe email an password

  // Register withe email an password

  // sigin out
  Future signout() async {
    try {
      return _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
