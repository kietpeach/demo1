import 'package:K1/screens/authenticate/authenticate.dart';
import 'package:K1/screens/home/home.dart';
import 'package:flutter/material.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    //return either Home or Autheticate widget
    return Authenticate();
  }
}