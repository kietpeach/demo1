import 'package:K1/screens/authenticate/authenticate.dart';
import 'package:K1/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/user.dart';
import 'authenticate/authenticate.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<MyUser>(context); //goi provider user

    //return either Home or Autheticate widget
    // xet trang thai cua user de dua ve trang Dang ki/nhap hoac trang Home
    if (user == null) {
      return Authenticate();
    } else {
      return Home();
    }
  }
}
