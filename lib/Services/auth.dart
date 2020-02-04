import 'package:castillo_ranking/Models/user.dart';
import 'package:castillo_ranking/Services/database.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //Create User obj based on firebase User.
  User _userSignedIn(FirebaseUser user) {
    return user != null
        ? User(uid: user.uid, displayName: user.displayName, email: user.email)
        : null;
  }

  //Auth Change user stream
  Stream<User> get user {
    return _auth.onAuthStateChanged.map(_userSignedIn);
  }

  //Sign in w/ email n password
  Future signIn(String email, String password) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      return _userSignedIn(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //Register w/ email n password
  Future registerWithEmailAndPassword(String name,String email, String password) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      

      // create a doc for new user with uid
      await DatabaseService(uid: user.uid).updateUserData('', '', 0, false);
      print(name);
      return _userSignedIn(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //Sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
