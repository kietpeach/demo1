import 'package:K1/screens/authenticate/sign_in.dart';
import 'package:K1/services/auth.dart';
import 'package:K1/shared/constants.dart';
import 'package:K1/shared/loading.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
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
              backgroundColor: Colors.white,
              appBar: AppBar(
                actions: [
                  FlatButton.icon(
                      onPressed: () {
                        Navigator.pop(context,
                            MaterialPageRoute(builder: (context) => SignIn()));
                      },
                      icon: Icon(Icons.person),
                      label: Text('Đăng nhập'))
                ],
                backgroundColor: Colors.brown[400],
                elevation: 0.0,
                title: Text(
                  'Đăng kí Kpeach Coffee',
                  style: TextStyle(fontFamily: 'Yellowtail'),
                ),
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
                          color: Colors.redAccent[100],
                          child: Text(
                            "Đăng kí",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          onPressed: () async {
                            if (_formKey.currentState.validate()) {
                              setState(() => loading = true);
                              dynamic result =
                                  await _auth.register(_email, _password);
                              if (result == null) {
                                setState(() {
                                  _error = 'Đăng kí thất bại';
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
                      ),
                      SizedBox(
                        height: 12.0,
                      ),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/images.png'),
                                  fit: BoxFit.cover)),
                        ),
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
