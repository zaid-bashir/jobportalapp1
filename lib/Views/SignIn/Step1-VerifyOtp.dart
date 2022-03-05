// ignore_for_file: must_be_immutable, unnecessary_string_interpolations, prefer_final_fields, unused_field, avoid_print, deprecated_member_use, unused_local_variable

import 'dart:async';
import 'dart:convert';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iconsax/iconsax.dart';
import 'package:job_portal/Data_Controller/apiresponse.dart';
import 'package:job_portal/Models/GetOtp.dart';
import 'package:job_portal/Models/VerifyOtp.dart';
import 'package:job_portal/Services/ApiServices.dart';
import 'package:job_portal/Views/SignIn/Step2-BasicDetails.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerifyOTP extends StatefulWidget {
  VerifyOTP({Key key, this.registerMobile, this.otp, this.countryCode})
      : super(key: key);
  String registerMobile;
  dynamic otp;
  String countryCode;
  @override
  _VerifyOTPState createState() => _VerifyOTPState();
}

class _VerifyOTPState extends State<VerifyOTP> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  bool isResendVisible = false;
  String currentText = "";
  var otpController = TextEditingController();
  bool isLoading = false;
  ApiServices apiServices = ApiServices();
  ApiResponse<String> _apiResponse;
  ApiResponse<dynamic> _apiResponseGetOTP;
  bool _onEditing = true;
  String _code = "0";
  int start = 60;
  bool wait = false;
  String buttonName = "Verify OTP";
  ScaffoldState scaffold;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => _scaffoldKey.currentState.showSnackBar(
        SnackBar(
          // action: SnackBarAction(label: "JobPortalApp", onPressed: (){}),
          content: Row(children: [
            const Icon(
              Icons.done,
              color: Colors.white,
            ),
            const SizedBox(width: 7),
            Expanded(
              child: Text(
                  "OTP Successfully Sent to Mobile Number ${widget.countryCode}-${widget.registerMobile}"),
            ),
          ]),
          backgroundColor: Colors.green,
          duration: const Duration(milliseconds: 2500),
        ),
      ),
    );
    // startTimer();
  }

  var key = GlobalKey<FormState>();

    fetchOTP({String mobileNumber, String countryCode}) async {
    setState(() {
      isLoading = true;
    });
    _apiResponseGetOTP = await apiServices.otpGet(
        objGetOtp: GetOTP(registerMobile: mobileNumber),
        countryCode: countryCode);
    setState(() {
      isLoading = false;
    });
  }

  verifyOTP(String otp) async {
    print(otp);
    setState(() {
      isLoading = true;
    });
    _apiResponse = await apiServices.otpVerifyGet(
        OTPVerify(registerMobile: "${widget.registerMobile}", otp: otp));
    setState(() {
      isLoading = false;
    });
  }

  void showSnack() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
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
                      style: TextStyle(
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
                      "Enter the 6 digit OTP recieved on your registered mobile no\n ${widget.countryCode}-${widget.registerMobile}",
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
                  PinCodeTextField(
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.allow(RegExp("[0-9]"))
                    ],
                    keyboardType: TextInputType.number,
                    autoFocus: true,
                    focusNode: FocusNode(canRequestFocus: true),
                    length: 6,
                    obscureText: false,
                    animationType: AnimationType.fade,
                    pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(5),
                      fieldHeight: 50,
                      fieldWidth: 40,
                      activeFillColor: Colors.white,
                    ),
                    animationDuration: const Duration(milliseconds: 300),
                    backgroundColor: Colors.blue.shade50,
                    // onCompleted: (v) {
                    //   _code = v;
                    // },
                    onChanged: (value) {
                      debugPrint(value);
                      currentText = value;
                    },
                    appContext: context,
                  ),
                  const SizedBox(
                    height: 20,
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
                          "Didn't receive the OTP?",
                          style: TextStyle(
                              fontSize: 14, color: Colors.grey.shade500),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        isResendVisible ? showResendButton() : const SizedBox(),
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
                        await verifyOTP(currentText);
                        if (_apiResponse.responseCode == 200) {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(
                                SnackBar(
                                  content: Row(children: [
                                    const Icon(
                                      Icons.done,
                                      color: Colors.white,
                                    ),
                                    const SizedBox(width: 7),
                                    Expanded(
                                      child: Text(jsonDecode(
                                          _apiResponse.data)['response']),
                                    ),
                                  ]),
                                  backgroundColor: Colors.green,
                                  duration: const Duration(milliseconds: 1500),
                                ),
                              )
                              .closed
                              .then((reason) {
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => BasicDetails(
                                          countryCode: widget.countryCode,
                                          mobileNo: widget.registerMobile,
                                        )),
                                (route) => false);
                          });
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Row(children: [
                              const Icon(
                                Icons.error_outline,
                                color: Colors.white,
                              ),
                              const SizedBox(width: 7),
                              Expanded(child: Text(jsonDecode(_apiResponse.data)['message'])),
                            ]),
                            backgroundColor: Colors.red,
                            duration: const Duration(milliseconds: 2500),
                          ));
                        }
                      },
                      color: Colors.orange.shade400,
                      minWidth: MediaQuery.of(context).size.width * 0.8,
                      height: 50,
                      child: Text(buttonName),
                    ),
                  ),
                ],
              )),
          const SizedBox(
            height: 20,
          ),
          Center(
            child: RichText(
                text: TextSpan(
              children: [
                const TextSpan(
                  text: "Send OTP again in ",
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
                TextSpan(
                  text: "00:$start",
                  style:
                      const TextStyle(fontSize: 16, color: Colors.pinkAccent),
                ),
                const TextSpan(
                  text: " sec ",
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
              ],
            )),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }

  // void startTimer() {
  //   const onsec = Duration(seconds: 1);
  //   Timer _timer = Timer.periodic(onsec, (timer) {
  //     if (start == 0) {
  //       setState(() {
  //         isResendVisible = true;
  //         timer.cancel();
  //         buttonName = "Verify OTP";
  //         wait = false;
  //       });
  //     } else {
  //       setState(() {
  //         start--;
  //       });
  //     }
  //   });
  // }

  Widget showResendButton() {
    return TextButton.icon(
      onPressed: () async {
        await fetchOTP(countryCode: widget.countryCode,mobileNumber: widget.registerMobile);
        if (_apiResponseGetOTP.responseCode == 200) {
          setState(() {
            
            // startTimer();
          });
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Row(children: [
                      const Icon(
                        Icons.verified_outlined,
                        color: Colors.white,
                      ),
                      const SizedBox(width: 7),
                      Text("OTP Successfully Sent to Mobile Number ${widget.countryCode}-${widget.registerMobile}"),
                    ]),
                    backgroundColor: Colors.green,
                    duration: const Duration(milliseconds: 2500),
                  ));
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Row(children: [
                      const Icon(
                        Icons.error_outline,
                        color: Colors.white,
                      ),
                      const SizedBox(width: 7),
                      Text("${_apiResponseGetOTP.data['message']}"),
                    ]),
                    backgroundColor: Colors.red,
                    duration: const Duration(milliseconds: 2500),
                  ));
                }
      },
      icon: const Icon(Iconsax.monitor_mobbile),
      label: const Text("Resend OTP"),
    );
  }
}
