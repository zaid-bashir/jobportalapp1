// ignore_for_file: deprecated_member_use, sized_box_for_whitespace, prefer_const_constructors, duplicate_ignore

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:job_portal/Views/profilechoice.dart';
import 'package:job_portal/Views/recruiter.dart';

import 'package:job_portal/Views/register.dart';

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
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      FlatButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(36),
                            side: const BorderSide(color: Colors.black),
                          ),
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (
                                context) => Register()));
                          }, child: const Text("JOIN"))
                    ],
                  ),
                  Container(
                    height: 300,
                    // ignore: prefer_const_constructors
                    child: Image(
                      image: AssetImage('assets/log.webp'), height: 300,),
                  ),
                  const SizedBox(height: 20,),
                  TextField(
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(0.0),
                      labelText: 'Email',
                      hintText: 'Username or e-mail',
                      labelStyle: const TextStyle(
                        color: Colors.black,
                        fontSize: 14.0,
                        fontWeight: FontWeight.w400,
                      ),
                      hintStyle: const TextStyle(
                        color: Colors.grey,
                        fontSize: 14.0,
                      ),
                      prefixIcon: const Icon(
                        Iconsax.user, color: Colors.black, size: 18,),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.grey.shade200, width: 2),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      floatingLabelStyle: const TextStyle(
                        color: Colors.black,
                        fontSize: 18.0,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Colors.black, width: 1.5),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20,),
                  TextField(
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(0.0),
                      labelText: 'Password',
                      hintText: 'Password',
                      hintStyle: const TextStyle(
                        color: Colors.grey,
                        fontSize: 14.0,
                      ),
                      labelStyle: const TextStyle(
                        color: Colors.black,
                        fontSize: 14.0,
                        fontWeight: FontWeight.w400,
                      ),
                      prefixIcon: const Icon(
                        Iconsax.key, color: Colors.black, size: 18,),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.grey.shade200, width: 2),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      floatingLabelStyle: const TextStyle(
                        color: Colors.black,
                        fontSize: 18.0,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Colors.black, width: 1.5),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
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
                  FadeInDown(
                    delay: const Duration(milliseconds: 600),
                    child: MaterialButton(
                      minWidth: double.infinity,
                      onPressed: () {
                        setState(() {
                          _isLoading = true;
                        });

                        Future.delayed(const Duration(seconds: 2), () {
                          setState(() {
                            _isLoading = false;
                          });
                        }).then((value) =>
                            Navigator.push(context, MaterialPageRoute(
                                builder: (context) => Verification()))
                        );
                      },
                      color: Colors.black,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)
                      ),
                      padding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 30),
                      child: _isLoading ? const SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(
                          backgroundColor: Colors.white,
                          color: Colors.black,
                          strokeWidth: 2,
                        ),
                      ) :
                      const Text(
                        "Request OTP", style: TextStyle(color: Colors.white),),
                    ),
                  ),
                  const SizedBox(height: 20,),
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
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Recruiter()));
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
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children: [
                  //     Text('Don\'t have an account?', style: TextStyle(color: Colors.grey.shade600, fontSize: 14.0, fontWeight: FontWeight.w400),),
                  //     TextButton(
                  //       onPressed: () {},
                  //       child: Text('Register', style: TextStyle(color: Colors.blue, fontSize: 14.0, fontWeight: FontWeight.w400),),
                  //     )
                  //   ],
                  // ),
                ],
              ),
            ),
          )
      ),
    );
  }
}
