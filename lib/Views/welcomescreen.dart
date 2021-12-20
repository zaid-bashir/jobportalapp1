
import 'package:flutter/material.dart';
import 'package:job_portal/Views/BottomNavBar/bottommenubar.dart';
import 'package:job_portal/Views/BottomNavBar/homepage.dart';



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
            return Navbar();
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
          Text("Setting Up Your Profile !",style:TextStyle(
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
