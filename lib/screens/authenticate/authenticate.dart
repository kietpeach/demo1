import 'package:K1/screens/authenticate/register.dart';
import 'package:K1/screens/authenticate/sign_in.dart';
import 'package:K1/screens/home/home.dart';
import 'package:flutter/material.dart';

import 'sign_in.dart';
import 'sign_in.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  @override
  Widget build(BuildContext context) {
    return Container(child: SignIn());
  }
}
