import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:job_portal/Data_Controller/apiresponse.dart';
import 'package:job_portal/Models/GetOtp.dart';
import 'package:job_portal/Services/ApiServices.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:job_portal/Views/SignIn/Step1-VerifyOtp.dart';

class OTP extends StatefulWidget {
  const OTP({Key key}) : super(key: key);
  @override
  _OTPState createState() => _OTPState();
}

class _OTPState extends State<OTP> {
  bool isLoading = false;
  ApiServices apiServices = ApiServices();
  ApiResponse<int> _apiResponse;

  fetchOTP(String mobileNumber) async {
    setState(() {
      isLoading = true;
    });
    _apiResponse =
    await apiServices.otpGet(GetOTP(registerMobile: "91-$mobileNumber"));
    setState(() {
      isLoading = false;
    });
  }

  var formKey = GlobalKey<FormState>();
  var mobileController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Image.asset(
            "assets/illustration_one.png",
            height: 180,
            fit: BoxFit.contain,
          ),
          const SizedBox(
            height: 20,
          ),
          const Padding(
            padding: EdgeInsets.all(15.0),
            child: Text(
              "Register with a Mobile Number",
              textAlign: TextAlign.center,
              style:  TextStyle(
                  fontSize: 20,
                  fontFamily: "ProximaNova",
                  fontWeight: FontWeight.w900),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Center(
            child: Text(
              "Enter Your Mobile Number we will send you OTP to Verify",
              style:  TextStyle(
                  fontSize: 12,
                  fontFamily: "ProximaNova",
                  fontWeight: FontWeight.w600),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Flexible(
                      flex: 1,
                      child: Container(
                        height: 47,
                        width: 50,
                        margin: const EdgeInsets.fromLTRB(0, 10, 3, 30),
                        decoration: const BoxDecoration(
                          border:  Border(
                            bottom: BorderSide(color: Colors.grey),
                          ),
                        ),
                        child: const Center(
                          child: Text(
                            "+91",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.w900),
                          ),
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 5,
                      child: Form(
                        key: formKey,
                        child: TextFormField(
                          controller: mobileController,
                          maxLines: 1,
                          maxLength: 10,

                          decoration: const InputDecoration(
                            contentPadding:  EdgeInsetsDirectional.all(10),
                            hintText: "Enter Your Mobile Number",
                          ),
                          keyboardType: TextInputType.number,
                          autocorrect: true,
                          validator: (value) {
                            if (value.isEmpty) {
                              return "Mobile Number can not be empty";
                            }
                            if (value.length < 10) {
                              return "Please enter 10 digits mobile number";
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          // ignore: prefer_const_constructors
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: GFButton(
              onPressed: () async {
                // ignore: avoid_print
                if (formKey.currentState.validate()) {
                  await fetchOTP(mobileController.text);
                  if (_apiResponse.data == 1) {
                    AwesomeDialog(
                      context: context,
                      animType: AnimType.SCALE,
                      dialogType: DialogType.INFO,
                      title: 'JobPortalApp',
                      desc: "Mobile Number Not Received,Please enter your Mobile Number",
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
                      desc: "Please enter your Mobile Number",
                      // btnOkOnPress: () {
                      //   Navigator.of(context).pop();
                      // },
                    ).show();
                  }
                  if (_apiResponse.data == 3) {
                    AwesomeDialog(
                      context: context,
                      animType: AnimType.SCALE,
                      dialogType: DialogType.ERROR,
                      title: 'JobPortalApp',
                      desc: "Invalid Mobile Number",
                      // btnOkOnPress: () {
                      //   Navigator.of(context).pop();
                      // },
                    ).show();
                  }
                  if (_apiResponse.data == 4) {
                    AwesomeDialog(
                      context: context,
                      animType: AnimType.SCALE,
                      dialogType: DialogType.INFO,
                      title: 'JobPortalApp',
                      desc: "Number Already Present",
                      // btnOkOnPress: () {
                      //   Navigator.of(context).pop();
                      // },
                    ).show();
                  }
                  if(_apiResponse.data.toString().length == 6){
                    AwesomeDialog(
                      context: context,
                      animType: AnimType.SCALE,
                      dialogType: DialogType.SUCCES,
                      title: 'JobPortalApp',
                      desc:
                      'OTP Successfully Sent to Mobile Number +91-${mobileController.text}',
                      btnOkOnPress: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => VerifyOTP(
                              registerMobile: mobileController.text,
                              otp: _apiResponse.data,
                            ),
                          ),
                        );
                      },
                    ).show();
                  }
                 } else {
                   Fluttertoast.showToast(
                       msg: "Phone Number Not Valid",
                       toastLength: Toast.LENGTH_LONG,
                       gravity: ToastGravity.BOTTOM,
                       timeInSecForIosWeb: 2,
                       backgroundColor: Colors.red,
                       textColor: Colors.white,
                       fontSize: 16.0);
                 }
              },
              text: "Get OTP",
              type: GFButtonType.solid,
              blockButton: true,
            ),
          ),
        ],
      ),
    );
  }
}
