import 'package:flutter/material.dart';
import 'package:job_portal/Views/Home/screens/landingpage.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    var d = const Duration(seconds: 5);
    Future.delayed(d, () {
      Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (context) {
            return LandingPage();
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
              image: AssetImage('assets/splash.jpg'),
              // height: 150.0,
              // width: 100.0,
            ),
          ),
          Text("Welcome Job Portal",style:TextStyle(
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
