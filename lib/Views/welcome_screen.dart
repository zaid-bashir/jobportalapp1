// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';

import '../home_page.dart';


class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  void initState() {
    var d = const Duration(seconds: 5);
    Future.delayed(d, () {
      Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (context) {
            return HomePage();
          }), (route) => false);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          Center(
            child:  Image(
              fit: BoxFit.fill ,
              image: AssetImage('assets/welcome.png'),
              // height: 150.0,
              // width: 100.0,
            ),
          ),
          Text("Ready to go !",style:TextStyle(
            fontFamily: "OpenSans",
            fontWeight: FontWeight.w500,
            letterSpacing: 1.5,
            fontSize: 16.5,
          ),
          ),
        ],
      ),
    );
  }
}
