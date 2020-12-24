import 'package:K1/services/auth.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
          child: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        appBar: AppBar(backgroundColor: Colors.brown[400],
        elevation: 0.0,
        title: Text('Sign In Bar'),),
        body: Container(
          padding: EdgeInsets.all(14.0),
          child: RaisedButton(child: Text('Sign in anon'),
          onPressed: ()async{
            dynamic result = await _auth.signInAnon();
            if(result == null){
              print('error sign in');
            }else{
              print('signed in');
              print(result);
            }
          },),
        ),
      ),
    );
  }
}