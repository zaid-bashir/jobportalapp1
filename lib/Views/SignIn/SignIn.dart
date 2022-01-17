// ignore_for_file: prefer_const_constructors, prefer_final_fields, unused_field, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:job_portal/Views/Candidate/BottomNavbar.dart';
import 'package:job_portal/Views/SignIn/Step1-Otp.Dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:job_portal/Views/SignIn/Step2-BasicDetails.dart';
import 'package:overlay_support/overlay_support.dart';
class LoginPage extends StatefulWidget {
  const LoginPage({ Key key }) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isLoading = false;
  bool hasInternet = false;

  @override
  void initState() {
    super.initState();

  }

  void checkInternetStatus() async {
    hasInternet = await InternetConnectionChecker().hasConnection;
    final color = hasInternet ? Colors.green : Colors.red;
    final text = hasInternet ? "Connected with Internet" : "Disconnected from Internet";
    showSimpleNotification(
      Text(text,style: TextStyle(color: Colors.white,fontSize: 20,),),
      background : color,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Row(

                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text("Login to your\naccount ",style:  TextStyle(
                        fontFamily: "OpenSans",
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.5,
                        fontSize: 20.5,
                      ),),

                    ],
                  ),

                  const SizedBox(height: 20,),
                         const TextField(
                           decoration: InputDecoration(
                             contentPadding: EdgeInsets.all(0.0),
                             labelText: 'Email Or Phone',
                             labelStyle: TextStyle(
                               color: Colors.blueGrey,
                               fontFamily: "ProximaNova",
                               fontWeight: FontWeight.w500,
                               letterSpacing: 1.5,
                               fontSize: 15.5,
                             ),
                             floatingLabelStyle: TextStyle(
                               color:  Color(0xff3e61ed),
                               fontFamily: "ProximaNova",
                               fontWeight: FontWeight.bold,
                               // letterSpacing: 1.5,
                               fontSize: 17.5,
                             ),
                             focusedBorder: UnderlineInputBorder(
                               borderSide: BorderSide(
                                   color:  Color(0xff3e61ed),),
                             ),
                           ),
                         ),
                  const SizedBox(height: 20,),
                  const TextField(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(0.0),
                      labelText: 'Password',
                      labelStyle: TextStyle(
                        color: Colors.blueGrey,
                        fontFamily: "ProximaNova",
                        fontWeight: FontWeight.w500,
                        letterSpacing: 1.5,
                        fontSize: 15.5,
                      ),
                      floatingLabelStyle: TextStyle(
                        color: Color(0xff3e61ed),
                        fontFamily: "ProximaNova",
                        fontWeight: FontWeight.bold,
                        // letterSpacing: 1.5,
                        fontSize: 17.5,
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xff2972ff),),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                          // Navigator.push(context, MaterialPageRoute(builder: (context)=>KeySkills()));
                        },
                        child: const Text('Forgot Password?', style: TextStyle(
                            color: Colors.black,
                            fontSize: 14.0,
                            fontWeight: FontWeight.w400),),
                      )
                    ],
                  ),
                  const SizedBox(height: 20,),
                  Container(
                    width: double.infinity,
                    child: GFButton(
                      color: Color(0xff3e61ed),
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Navbar()));
                      },text: "Login",textStyle:TextStyle(
                      color: Colors.white,
                      fontFamily: "ProximaNova",
                      fontWeight: FontWeight.bold,
                      // letterSpacing: 1.5,
                      fontSize: 14.5,
                    ),),
                  ),
                  SizedBox(height: 20,),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Don\'t have an account?', style: TextStyle(color: Colors.grey.shade600, fontSize: 14.0, fontWeight: FontWeight.w400),),
                      TextButton(
                        onPressed: () {
                          // Navigator.push(context, MaterialPageRoute(builder: (context)=>CareerPreference()));
                          // Navigator.push(context, MaterialPageRoute(builder: (context)=>OTP()));
                          // Navigator.push(context, MaterialPageRoute(builder: (context)=>WorkingProfession()));
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>BasicDetails(mobileNo: "9906543212",),
                          ));
                          // Navigator.push(context, MaterialPageRoute(builder: (context)=>listCheck()));
                          // Navigator.push(context, MaterialPageRoute(builder: (context)=>QualificationBlueCollar()));
                          // Navigator.push(context, MaterialPageRoute(builder: (6644
                          //     context) => BasicDetails()));
                        },
                        child: Text('Register', style: TextStyle(color:  Color(0xff2972ff), fontSize: 14.0, fontWeight: FontWeight.w400),),
                      )
                    ],
                  ),
                ],
                // Navigator.push(context, MaterialPageRoute(builder: (context)=>PersonalDetails()));
                // Navigator.push(context, MaterialPageRoute(builder: (context)=>WorkingProfession()));
              ),
            ),
          )
      ),
    );
  }
}
