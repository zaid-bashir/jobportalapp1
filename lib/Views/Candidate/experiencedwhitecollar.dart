import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ExperiencedWhite extends StatefulWidget {
  const ExperiencedWhite({Key key}) : super(key: key);

  @override
  _ExperiencedWhiteState createState() => _ExperiencedWhiteState();
}

class _ExperiencedWhiteState extends State<ExperiencedWhite> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left:3.0),
        child: Column(children: [
        ListTile(
        leading: IconButton(
        onPressed: () {
      Navigator.of(context).pop();
      },
        icon: const Icon(Icons.arrow_back),
        color: Colors.black,
      ),
      title: Text('Experienced White Collar',
          style: const TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.bold,
              fontFamily: "ProximaNova"),

      ),
    ),




    ] ) ), );
  }
}