import 'package:K1/models/kiet.dart';
import 'package:K1/screens/home/kiet_list.dart';
import 'package:K1/screens/home/setting_form.dart';
import 'package:K1/services/database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../services/auth.dart';
import '../../services/auth.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    //ham hien bang menu bottom Tuy chon
    void _showSettingsPanel() {
      showModalBottomSheet(
          context: context,
          builder: (context) {
            return Container(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 60),
                child: SettingForm());
          });
    }

    //khoi tao provider de truyen data vao UI
    return StreamProvider<List<Kiet>>.value(
      value: DatabaseService().kiet,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              "KPeach Coffee",
              style: TextStyle(fontFamily: 'Yellowtail'),
            ),
            backgroundColor: Colors.brown[400],
            elevation: 0.0,
            actions: [
              FlatButton.icon(
                  icon: Icon(Icons.person),
                  label: Text("Đăng xuất"),
                  onPressed: () async {
                    await _auth
                        .signOut(); // khi hoan thanh signout thi tra user ve null va vao trang Authenticate Dang nhap/ki
                  }),
              FlatButton.icon(
                  onPressed: () => _showSettingsPanel(),
                  icon: Icon(Icons.settings),
                  label: Text('Tùy chọn'))
            ],
          ),
          body: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/coffee_bg.png'),
                    fit: BoxFit.cover)),
            child: KietList(),
          ),
        ),
      ),
    );
  }
}
