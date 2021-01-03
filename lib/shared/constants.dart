import 'package:flutter/material.dart';

//su dung trang tri cho 1 TextField
const textInputDecoration = InputDecoration(
  fillColor: Colors.white,
  filled: true,
  labelStyle: TextStyle(
    fontSize: 16,
    color: Colors.black,
  ),
  enabledBorder:
      OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
  focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.pink),
      borderRadius: BorderRadius.all(Radius.circular(20))),
);
