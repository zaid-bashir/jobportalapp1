import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:job_portal/Views/profilechoice.dart';
import 'package:job_portal/Views/recruiter.dart';

import 'package:job_portal/Views/register.dart';
import 'package:job_portal/Views/ui/bottom_menu_bar.dart';
import 'package:job_portal/Views/ui/home_page.dart';

import 'otp.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({ Key key }) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isLoading = false;


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
                               fontFamily: "Poppins",
                               fontWeight: FontWeight.w500,
                               letterSpacing: 1.5,
                               fontSize: 15.5,
                             ),
                             floatingLabelStyle: TextStyle(
                               color:  Color(0xff3e61ed),
                               fontFamily: "Poppins",
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
                  // TextField(
                  //   cursorColor: Colors.blue,
                  //   decoration: InputDecoration(
                  //     contentPadding: const EdgeInsets.all(0.0),
                  //     labelText: 'Email',
                  //     hintText: 'Username or e-mail',
                  //     labelStyle: const TextStyle(
                  //       color: Colors.blue,
                  //       fontFamily: "Poppins",
                  //       fontWeight: FontWeight.w500,
                  //       letterSpacing: 1.5,
                  //       fontSize: 14.5,
                  //     ),
                  //     hintStyle: const TextStyle(
                  //       fontFamily: "Poppins",
                  //       fontWeight: FontWeight.w500,
                  //       letterSpacing: 1.5,
                  //       fontSize: 14.5,
                  //     ),
                  //     prefixIcon: const Icon(
                  //       Iconsax.user, color: Colors.lightBlue, size: 18,),
                  //     enabledBorder: OutlineInputBorder(
                  //       borderSide: BorderSide(
                  //           color: Colors.grey.shade200, width: 2),
                  //       borderRadius: BorderRadius.circular(10.0),
                  //     ),
                  //     floatingLabelStyle: const TextStyle(
                  //       color: Colors.blue,
                  //       fontFamily: "Poppins",
                  //       fontWeight: FontWeight.bold,
                  //       letterSpacing: 1.5,
                  //       fontSize: 14.5,
                  //     ),
                  //     focusedBorder: OutlineInputBorder(
                  //       borderSide: const BorderSide(
                  //           color: Colors.lightBlueAccent, width: 1.5),
                  //       borderRadius: BorderRadius.circular(10.0),
                  //     ),
                  //   ),
                  // ),
                  const SizedBox(height: 20,),
                  const TextField(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(0.0),
                      labelText: 'Password',
                      labelStyle: TextStyle(
                        color: Colors.blueGrey,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w500,
                        letterSpacing: 1.5,
                        fontSize: 15.5,
                      ),
                      floatingLabelStyle: TextStyle(
                        color: Color(0xff3e61ed),
                        fontFamily: "Poppins",
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
                  // TextField(
                  //   cursorColor: Colors.black,
                  //   decoration: InputDecoration(
                  //     contentPadding: const EdgeInsets.all(0.0),
                  //     labelText: 'Password',
                  //     hintText: 'Password',
                  //     hintStyle: const  TextStyle(
                  //       fontFamily: "Poppins",
                  //       fontWeight: FontWeight.w500,
                  //       letterSpacing: 1.5,
                  //       fontSize: 14.5,
                  //     ),
                  //     labelStyle:  TextStyle(
                  //       color: Colors.blue,
                  //       fontFamily: "Poppins",
                  //       fontWeight: FontWeight.w500,
                  //       letterSpacing: 1.5,
                  //       fontSize: 14.5,
                  //     ),
                  //     prefixIcon: const Icon(
                  //       Iconsax.key, color: Colors.lightBlue, size: 18,),
                  //     enabledBorder: OutlineInputBorder(
                  //       borderSide: BorderSide(
                  //           color: Colors.grey.shade200, width: 2),
                  //       borderRadius: BorderRadius.circular(10.0),
                  //     ),
                  //     floatingLabelStyle: const  TextStyle(
                  //       color: Colors.blue,
                  //       fontFamily: "Poppins",
                  //       fontWeight: FontWeight.bold,
                  //       letterSpacing: 1.5,
                  //       fontSize: 14.5,
                  //     ),
                  //     focusedBorder: OutlineInputBorder(
                  //       borderSide: const BorderSide(
                  //           color: Colors.lightBlueAccent, width: 1.5),
                  //       borderRadius: BorderRadius.circular(10.0),
                  //     ),
                  //   ),
                  // ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {},
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
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.bold,
                      // letterSpacing: 1.5,
                      fontSize: 14.5,
                    ),),
                  ),
                  // FadeInDown(
                  //   delay: const Duration(milliseconds: 600),
                  //   child: GFButton(
                  //
                  //     onPressed: () {
                  //       setState(() {
                  //         _isLoading = true;
                  //       });
                  //
                  //       Future.delayed(const Duration(seconds: 2), () {
                  //         setState(() {
                  //           _isLoading = false;
                  //         });
                  //       }).then((value) =>
                  //           Navigator.push(context, MaterialPageRoute(
                  //               builder: (context) => Verification()))
                  //       );
                  //     },
                  //     color: Colors.blue,
                  //
                  //     padding: const EdgeInsets.symmetric(
                  //         vertical: 15, horizontal: 30),
                  //     child: _isLoading ? const SizedBox(
                  //       width: 20,
                  //       height: 20,
                  //       child: CircularProgressIndicator(
                  //         backgroundColor: Colors.white,
                  //         color: Colors.black,
                  //         strokeWidth: 2,
                  //       ),
                  //     ) :
                  //     const Text(
                  //       "Request OTP", style: TextStyle(
                  //       color: Colors.white,
                  //       fontFamily: "Poppins",
                  //       fontWeight: FontWeight.bold,
                  //       letterSpacing: 1.5,
                  //       fontSize: 14.5,
                  //     ),),
                  //   ),
                  // ),
                   SizedBox(height: 20,),
                  Row(
                    children: const [
                      Expanded(child: Divider(
                        endIndent: 20,
                        indent: 10,

                        thickness: 1.3,
                      )),
                      Text("OR"),
                      Expanded(child: Divider(
                        indent: 20,
                        endIndent: 10,
                        thickness: 1.3,

                      )),
                    ],
                  ),
                  const SizedBox(height: 10,),

                  FlatButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(36),
                      side: const BorderSide(color: Colors.black),
                    ),
                    onPressed: () {
                      // Navigator.push(context, MaterialPageRoute(builder: (context) => Recruiter()));
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const <Widget>[
                          Image(
                            height: 30,
                            width: 20,
                            image: AssetImage(
                              'assets/google.png',
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text('Join with Google')
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  FlatButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(36),
                      side: const BorderSide(color: Colors.black),
                    ),
                    onPressed: () {
                     Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileChoice()));
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const <Widget>[
                          Image(
                            height: 30,
                            width: 30,
                            image: AssetImage(
                              'assets/apple-logo.png',
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text('Join with Apple')
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Don\'t have an account?', style: TextStyle(color: Colors.grey.shade600, fontSize: 14.0, fontWeight: FontWeight.w400),),
                      TextButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (
                              context) => Register()));
                        },
                        child: Text('Register', style: TextStyle(color:  Color(0xff2972ff), fontSize: 14.0, fontWeight: FontWeight.w400),),
                      )
                    ],
                  ),
                ],
              ),
            ),
          )
      ),
    );
  }
}
