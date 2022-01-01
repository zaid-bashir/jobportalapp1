// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, unused_field, curly_braces_in_flow_control_structures, must_be_immutable, avoid_print, avoid_single_cascade_in_expression_statements, unnecessary_string_interpolations

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter_verification_code/flutter_verification_code.dart';
import 'package:job_portal/Data_Controller/apiresponse.dart';
import 'package:job_portal/Models/verify_otp.dart';
import 'package:job_portal/Services/api_services.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:job_portal/Views/SignIn/step2-basicdetails.dart';

class VerifyOTP extends StatefulWidget {
  VerifyOTP({Key key, this.registerMobile, this.otp}) : super(key: key);

  String registerMobile;
  int otp;
  @override
  _VerifyOTPState createState() => _VerifyOTPState();
}

class _VerifyOTPState extends State<VerifyOTP> {
  bool isLoading = false;
  ApiServices apiServices = ApiServices();

  ApiResponse<String> _apiResponse;

  verifyOTP() async {
    setState(() {
      isLoading = true;
    });
    _apiResponse = await apiServices.otpVerify(
        OTPVerify(registerMobile: widget.registerMobile, otp: widget.otp));
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: ListView(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              height: MediaQuery.of(context).size.height,
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Image.asset("assets/19873.jpg"),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  FadeInDown(
                    duration: Duration(milliseconds: 500),
                    child: Text(
                      "Verification",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontFamily: "ProximaNova"),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  FadeInDown(
                    delay: Duration(milliseconds: 500),
                    duration: Duration(milliseconds: 500),
                    child: Text(
                      "Please enter the 4 digit code sent to \n +91-${widget.registerMobile}",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey.shade500,
                          height: 1.5),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),

                  // Verification Code Input
                  FadeInDown(
                    child: VerificationCode(
                      length: 6,
                      textStyle: TextStyle(fontSize: 20, color: Colors.black),
                      underlineColor: Colors.black,
                      keyboardType: TextInputType.number,
                      underlineUnfocusedColor: Colors.black,
                      onCompleted: (value) {
                        setState(() {
                          print(value);
                        });
                      },
                      onEditing: (value) {
                        print(value);
                      },
                    ),
                  ),

                  SizedBox(
                    height: 20,
                  ),
                  FadeInDown(
                    delay: Duration(milliseconds: 700),
                    duration: Duration(milliseconds: 500),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't receive the OTP?",
                          style: TextStyle(
                              fontSize: 14, color: Colors.grey.shade500),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        TextButton.icon(
                          onPressed: () {},
                          icon: Icon(Icons.reset_tv),
                          label: Text("Resend"),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  FadeInDown(
                    delay: Duration(milliseconds: 800),
                    duration: Duration(milliseconds: 500),
                    child: MaterialButton(
                      elevation: 0,
                      onPressed: () {
                          if (isLoading) {
                            AwesomeDialog(
                              context: context,
                              animType: AnimType.SCALE,
                              dialogType: DialogType.ERROR,
                              title: 'JobPortalApp',
                              desc: '${_apiResponse.errorMessage}',
                              btnOkOnPress: () {
                                Navigator.of(context).pop();
                              },
                            )..show();
                          } else {
                            AwesomeDialog(
                              context: context,
                              animType: AnimType.SCALE,
                              dialogType: DialogType.SUCCES,
                              title: 'JobPortalApp',
                              desc:
                                  'Mobile Number +91-${widget.registerMobile} Successfully Verified',
                              btnOkOnPress: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => BasicDetails(),
                                  ),
                                );
                              },
                            )..show();
                          }
                      },
                      color: Colors.orange.shade400,
                      minWidth: MediaQuery.of(context).size.width * 0.8,
                      height: 50,
                      child: Text("Verify OTP"),
                    ),
                  ),
                ],
              )),
          ],
        ),);
  }
}
