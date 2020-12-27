import 'package:flutter/material.dart';

//su dung cho cac TextField email pass
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
