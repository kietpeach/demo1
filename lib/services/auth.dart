import 'package:K1/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class AuthService{
  final FirebaseAuth _auth = FirebaseAuth.instance;
//create user obj based on firebaseUser
MyUser _fromFirebaseUser(User user){
  return user!=null ? MyUser(uid: user.uid):null;
}

  //sign in anon
  Future signInAnon() async {
    await Firebase.initializeApp();
    try{
      UserCredential result = await _auth.signInAnonymously();
      User user = result.user;
      return _fromFirebaseUser(user);
      
    }catch(err){
      print(err.toString());
      return null;
    }
  }

  //sign in with email & password

  //register with email & password

  //sign out
}