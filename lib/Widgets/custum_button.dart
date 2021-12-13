// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, use_key_in_widget_constructors, unnecessary_string_interpolations

import 'package:flutter/material.dart';

class CustumButton extends StatelessWidget {
  final String text;
  CustumButton({ this.text});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: 100,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.blue,
        ),
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Center(
        child: Text(
          "$text",
          style: TextStyle(
            color: Colors.blue,
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
