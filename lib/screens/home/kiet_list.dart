import 'package:K1/models/kiet.dart';
import 'package:K1/screens/home/kiet_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class KietList extends StatefulWidget {
  @override
  _KietListState createState() => _KietListState();
}

class _KietListState extends State<KietList> {
  @override
  Widget build(BuildContext context) {
    final kiet = Provider.of<List<Kiet>>(context) ?? [];
    return ListView.builder(
        itemCount: kiet.length,
        itemBuilder: (context, index) {
          return KietTile(kiet: kiet[index]);
        });
  }
}
