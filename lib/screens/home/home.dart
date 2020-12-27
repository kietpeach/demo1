import 'package:K1/screens/authenticate/sign_in.dart';
import 'package:flutter/material.dart';

import '../../services/auth.dart';
import '../../services/auth.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("KPeach"),
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        actions: [
          FlatButton.icon(
              icon: Icon(Icons.person),
              label: Text("Đăng xuất"),
              onPressed: () async {
                await _auth
                    .dangXuat(); // khi hoan thanh signout thi tra user ve null va vao trang Authenticate Dang nhap/ki
              })
        ],
      ),
    );
  }
}
