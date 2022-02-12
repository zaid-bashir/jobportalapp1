// ignore_for_file: prefer_const_constructors, avoid_single_cascade_in_expression_statements, must_be_immutable, unnecessary_string_interpolations, avoid_print, unnecessary_const

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_verification_code/flutter_verification_code.dart';
import 'package:job_portal/Data_Controller/apiresponse.dart';
import 'package:job_portal/Models/VerifyOtp.dart';
import 'package:job_portal/Services/ApiServices.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:job_portal/Views/SignIn/Step2-BasicDetails.dart';

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
  ApiResponse<int> _apiResponse;
  bool _onEditing = true;
  String _code = "0";
  var key = GlobalKey<FormState>();

  verifyOTP(String otp) async {
    setState(() {
      isLoading = true;
    });
    _apiResponse = await apiServices.otpVerifyGet(
        OTPVerify(registerMobile: "${widget.registerMobile}", otp: int.parse(otp)));
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              // height: MediaQuery.of(context).size.height,
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Image.asset("assets/ebook.png"),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  FadeInDown(
                    duration: const Duration(milliseconds: 500),
                    child: const Text(
                      "Verification",
                      style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontFamily: "ProximaNova"),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  FadeInDown(
                    delay: const Duration(milliseconds: 500),
                    duration: const Duration(milliseconds: 500),
                    child: Text(
                      "Please enter the 6 digit code sent to \n +91-${widget.registerMobile}",
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
                    key: key,
                    child: VerificationCode(
                      textStyle: TextStyle(fontSize: 20.0, color: Colors.red[900]),
                      underlineColor: Colors.amber,
                      keyboardType: TextInputType.number,
                      length: 6,
                      clearAll: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'clear all',
                          style: TextStyle(
                              fontSize: 14.0,
                              decoration: TextDecoration.underline,
                              color: Colors.blue[700]),
                        ),
                      ),
                      onCompleted: (String value) {
                        setState(() {
                          _code = value;
                        });
                      },
                      onEditing: (bool value) {
                        setState(() {
                          _onEditing = value;
                        });
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),

                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Center(
                      child: _onEditing
                          ? Text('Please enter full code')
                          : Text('Your code: $_code'),
                    ),
                  ),

                  const SizedBox(
                    height: 20,
                  ),
                  FadeInDown(
                    delay: const Duration(milliseconds: 700),
                    duration: const Duration(milliseconds: 500),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't receive the OTP?",
                          style: TextStyle(
                              fontSize: 14, color: Colors.grey.shade500),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        TextButton.icon(
                          onPressed: () {},
                          icon: const Icon(Icons.reset_tv),
                          label: const Text("Resend"),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  FadeInDown(
                    delay: const Duration(milliseconds: 800),
                    duration: const Duration(milliseconds: 500),
                    child: MaterialButton(
                      elevation: 0,
                      onPressed: () async {
                        print("======================");
                        print(_code);
                        print("======================");

                        await verifyOTP(_code);
                        print("======================");
                        print(_apiResponse.data);
                        print("======================");
                        if (_apiResponse.data == 1) {
                          AwesomeDialog(
                            context: context,
                            animType: AnimType.SCALE,
                            dialogType: DialogType.INFO,
                            title: 'JobPortalApp',
                            desc: 'Please enter your OTP',
                            // btnOkOnPress: () {
                            //   Navigator.of(context).pop();
                            // },
                          ).show();
                        }
                        if (_apiResponse.data == 2) {
                          AwesomeDialog(
                            context: context,
                            animType: AnimType.SCALE,
                            dialogType: DialogType.INFO,
                            title: 'JobPortalApp',
                            desc: 'OTP Length not valid',
                            // btnOkOnPress: () {
                            //   Navigator.of(context).pop();
                            // },
                          ).show();
                        }
                        if (_apiResponse.data == 4) {
                          AwesomeDialog(
                            context: context,
                            animType: AnimType.SCALE,
                            dialogType: DialogType.ERROR,
                            title: 'JobPortalApp',
                            desc: 'OTP Expired',
                            // btnOkOnPress: () {
                            //   Navigator.of(context).pop();
                            // },
                          ).show();
                        }
                        if (_apiResponse.data == 5) {
                          AwesomeDialog(
                            context: context,
                            animType: AnimType.SCALE,
                            dialogType: DialogType.INFO,
                            title: 'JobPortalApp',
                            desc: 'Incorrect OTP Or Mobile Number',
                            // btnOkOnPress: () {
                            //   Navigator.of(context).pop();
                            // },
                          ).show();
                        }
                        if (_apiResponse.data == 6) {
                          AwesomeDialog(
                            context: context,
                            animType: AnimType.SCALE,
                            dialogType: DialogType.ERROR,
                            title: 'JobPortalApp',
                            desc: "Verification Process failed\nTry Again...",
                            // btnOkOnPress: () {
                            //   Navigator.of(context).pop();
                            // },
                          ).show();
                        }
                        if (_apiResponse.data == 3) {
                          AwesomeDialog(
                            context: context,
                            animType: AnimType.SCALE,
                            dialogType: DialogType.SUCCES,
                            title: 'JobPortalApp',
                            desc: 'Mobile Number +91-${widget.registerMobile} Successfully Verified',
                            btnOkOnPress: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => BasicDetails(mobileNo: widget.registerMobile,),
                                ),
                              );
                            },
                          ).show();
                        }
                        if(int.parse(_code) == 0) {
                          AwesomeDialog(
                            context: context,
                            animType: AnimType.SCALE,
                            dialogType: DialogType.ERROR,
                            title: 'JobPortalApp',
                            desc:
                            'Please enter Valid OTP',
                          ).show();
                        }
                      },
                      color: Colors.orange.shade400,
                      minWidth: MediaQuery.of(context).size.width * 0.8,
                      height: 50,
                      child: const Text("Verify OTP"),
                    ),
                  ),
                ],
              )),
        ],
      ),);
  }
}
