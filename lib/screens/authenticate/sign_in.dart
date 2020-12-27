import 'package:K1/screens/authenticate/register.dart';
import 'package:K1/screens/home/home.dart';
import 'package:K1/services/auth.dart';
import 'package:K1/shared/constants.dart';
import 'package:K1/shared/loading.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  //text field state
  String _email = "";
  String _password = "";
  String _error = '';
  bool _showPass = false;

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
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Resgister()));
                      },
                      icon: Icon(Icons.person),
                      label: Text('Đăng kí'))
                ],
                backgroundColor: Colors.brown[400],
                elevation: 0.0,
                title: Text('Đăng nhập vào Kpeach'),
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
                          setState(() => _email = val);
                        },
                        decoration: textInputDecoration.copyWith(
                            labelText: 'Email',
                            hintText: 'tendangnhap@email.com'),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Stack(
                          alignment: AlignmentDirectional.centerEnd,
                          children: [
                            TextFormField(
                              validator: (val) => val.length < 6
                                  ? 'Nhập password của bạn dài hơn 6 kí tự'
                                  : null,
                              obscureText: !_showPass,
                              onChanged: (val) {
                                setState(() => _password = val);
                              },
                              decoration: textInputDecoration.copyWith(
                                  labelText: 'Password',
                                  hintText: 'Nhập mật khẩu'),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: GestureDetector(
                                  onTap: onTapShowPassword,
                                  child: Text(
                                    _showPass ? "Ẩn" : "Hiện",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )),
                            )
                          ]),
                      SizedBox(
                        height: 20.0,
                      ),
                      RaisedButton(
                          color: Colors.pink[400],
                          child: Text(
                            "Đăng Nhập",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          onPressed: () async {
                            if (_formKey.currentState.validate()) {
                              setState(() => loading = true);
                              dynamic result =
                                  await _auth.signin(_email, _password);
                              if (result == null) {
                                setState(() {
                                  _error = 'Đăng nhập thất bại';
                                  loading = false;
                                });
                              }
                            }
                          }),
                      SizedBox(
                        height: 12.0,
                      ),
                      Text(
                        _error,
                        style: TextStyle(color: Colors.red, fontSize: 14),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
  }

  void onTapShowPassword() {
    setState(() {
      _showPass = !_showPass;
    });
  }
}
