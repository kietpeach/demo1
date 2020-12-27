import 'package:K1/models/user.dart';
import 'package:K1/services/database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
//create user obj based on firebaseUser
  MyUser _fromFirebaseUser(User user) {
    return user != null ? MyUser(uid: user.uid) : null;
  }

// auth change user stream
  Stream<MyUser> get user {
    return _auth.authStateChanges().map((User user) => _fromFirebaseUser(user));
  }

  //sign in anon
  //su dung bat dong bo voi future async await
  Future signInAnon() async {
    await Firebase.initializeApp();
    try {
      UserCredential result = await _auth.signInAnonymously();
      User user = result.user;
      return _fromFirebaseUser(user);
    } catch (err) {
      print(err.toString());
      return null;
    }
  }

  //sign in with email & password
  Future signin(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User user = result.user;
      return _fromFirebaseUser(user);
    } catch (err) {
      print(err.toString());
      return null;
    }
  }

  //register with email & password
  Future register(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User user = result.user;

      //create a new document for the user with the uid
      await DatabaseService(uid:  user.uid).updateUserData('0', 'new kiet member', 100);
      return _fromFirebaseUser(user);
    } catch (err) {
      print(err.toString());
      return null;
    }
  }

  //sign out
  Future dangXuat() async {
    try {
      return await _auth.signOut();
    } catch (err) {
      print(err.toString());
      return null;
    }
  }
}
