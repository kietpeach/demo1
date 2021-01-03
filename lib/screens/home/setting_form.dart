import 'package:K1/models/user.dart';
import 'package:K1/services/database.dart';
import 'package:K1/shared/loading.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:K1/shared/constants.dart';
import 'package:provider/provider.dart';

class SettingForm extends StatefulWidget {
  @override
  _SettingFormState createState() => _SettingFormState();
}

class _SettingFormState extends State<SettingForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String> sugars = ['0%', '5%', '10%', '15%'];

  //form values
  String _currentName;
  String _currentSugars;
  int _currentStrength;

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<MyUser>(context);

    return StreamBuilder<UserData>(
        stream: DatabaseService(uid: user.uid).userData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            UserData userData = snapshot.data;
            return Form(
              key: _formKey,
              child: Column(
                children: [
                  Text(
                    'Thay đỗi tùy chọn.',
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    initialValue: userData.name,
                    decoration: textInputDecoration.copyWith(
                        hintText: 'Mời nhập tên bạn vào'),
                    validator: (val) =>
                        val.isEmpty ? 'Mời nhập tên bạn vào' : null,
                    onChanged: (val) => setState(() => _currentName = val),
                  ),
                  SizedBox(
                    height: 20,
                  ),

                  //dropdown
                  DropdownButtonFormField(
                      decoration: textInputDecoration,
                      value: _currentSugars ?? userData.sugars,
                      items: sugars.map((sugar) {
                        return DropdownMenuItem(
                          value: sugar,
                          child: Text('$sugar đường'),
                        );
                      }).toList(),
                      onChanged: (val) => setState(() => _currentSugars = val)),

                  //slider
                  Slider(
                    value: (_currentStrength ?? userData.strength).toDouble(),
                    activeColor:
                        Colors.brown[_currentStrength ?? userData.strength],
                    inactiveColor:
                        Colors.brown[_currentStrength ?? userData.strength],
                    min: 100,
                    max: 900,
                    divisions: 8,
                    onChanged: (val) =>
                        setState(() => _currentStrength = val.round()),
                  ),

                  RaisedButton(
                      color: Colors.pink[400],
                      child: Text(
                        'Cập nhật',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () async {
                        if (_formKey.currentState.validate()) {
                          await DatabaseService(uid: user.uid).updateUserData(
                              _currentSugars ?? userData.sugars,
                              _currentName ?? userData.name,
                              _currentStrength ?? userData.strength);
                          Navigator.pop(context);
                        }
                      })
                ],
              ),
            );
          } else {
            return Loading();
          }
        });
  }
}
