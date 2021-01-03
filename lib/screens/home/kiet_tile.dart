import 'package:flutter/material.dart';
import 'package:K1/models/kiet.dart';

class KietTile extends StatelessWidget {
  final Kiet kiet;
  KietTile({this.kiet});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20, 6, 20, 0),
        child: ListTile(
          leading: CircleAvatar(
            radius: 25,
            backgroundColor: Colors.brown[kiet.strength],
            backgroundImage: AssetImage('assets/coffee_icon.png'),
          ),
          title: Text(kiet.name),
          subtitle: Text('Pha ${kiet.sugars} đường'),
        ),
      ),
    );
  }
}
