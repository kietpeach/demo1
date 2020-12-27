import 'package:K1/screens/home/home.dart';
import 'package:K1/shared/constants.dart';
import 'package:K1/shared/loading.dart';
import 'package:flutter/material.dart';

import '../../services/auth.dart';
import '../../services/auth.dart';
import 'sign_in.dart';

class Resgister extends StatefulWidget {
  @override
  _ResgisterState createState() => _ResgisterState();
}

class _ResgisterState extends State<Resgister> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  //text field state
  String email = '';
  String password = '';
  String error = '';
  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : SafeArea(
            child: Scaffold(
              backgroundColor: Theme.of(context).primaryColor,
              appBar: AppBar(
                actions: [
                  FlatButton.icon(
                      onPressed: () {
                        Navigator.pop(context,
                            MaterialPageRoute(builder: (context) => SignIn()));
                      },
                      icon: Icon(Icons.person),
                      label: Text('Đăng Nhập'))
                ],
                backgroundColor: Colors.brown[400],
                elevation: 0.0,
                title: Text('Đăng kí tài khoản Kpeach'),
              ),
              body: Container(
                padding: EdgeInsets.all(14.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20.0,
                      ),
                      TextFormField(
                        validator: (val) =>
                            val.isEmpty ? 'Nhập Email của bạn' : null,
                        onChanged: (val) {
                          setState(() => email = val);
                        },
                        decoration: textInputDecoration.copyWith(
                            labelText: 'Email',
                            hintText: 'tendangnhap@email.com'),
                      ),
                      SizedBox(
                        height: 40.0,
                      ),
                      TextFormField(
                        validator: (val) => val.length < 6
                            ? 'Nhập password của bạn dài hơn 6 kí tự'
                            : null,
                        obscureText: true,
                        onChanged: (val) {
                          setState(() => password = val);
                        },
                        decoration: textInputDecoration.copyWith(
                            labelText: 'Password', hintText: 'Nhập mật khẩu'),
                      ),
                      SizedBox(
                        height: 40.0,
                      ),
                      RaisedButton(
                          color: Colors.pink[400],
                          child: Text(
                            "Đăng Kí",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          onPressed: () async {
                            if (_formKey.currentState.validate()) {
                              setState(() => loading = true);
                              dynamic result =
                                  await _auth.register(email, password);
                              if (result == null) {
                                setState(() {
                                  error = 'Email không hợp lệ';
                                  loading = false;
                                });
                              }
                            }
                          }),
                      SizedBox(
                        height: 12.0,
                      ),
                      Text(
                        error,
                        style: TextStyle(color: Colors.red, fontSize: 14),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
  }
}
