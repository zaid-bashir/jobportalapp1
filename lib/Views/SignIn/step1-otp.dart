// ignore_for_file: prefer_const_constructors, unnecessary_const, unused_field, unnecessary_new, curly_braces_in_flow_control_structures, sized_box_for_whitespace, unused_local_variable, avoid_print
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:job_portal/Models/get_otp.dart';
import 'package:job_portal/Services/api_services.dart';
import 'package:job_portal/Views/SignIn/step1-verifyotp.dart';

class OTP extends StatefulWidget {
  const OTP({Key key}) : super(key: key);

  @override
  _OTPState createState() => _OTPState();
}

class _OTPState extends State<OTP> {
  var formKey = GlobalKey<FormState>();
  var mobileController = TextEditingController();
  ApiServices apiServices = ApiServices();
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
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(
              "Register with a Mobile Number",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 20,
                  fontFamily: "ProximaNova",
                  fontWeight: FontWeight.w900),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Center(
            child: Text(
              "Enter Your Mobile Number we will send you OTP to Verify",
              style: TextStyle(
                  fontSize: 12,
                  fontFamily: "ProximaNova",
                  fontWeight: FontWeight.w600),
            ),
          ),
          SizedBox(
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
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(color: Colors.grey),
                          ),
                        ),
                        child: Center(
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
                            contentPadding: const EdgeInsetsDirectional.all(10),
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
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: GFButton(
              onPressed: () {
                if (formKey.currentState.validate()) {
                  int flag = 0;
                  ApiServices()
                      .getOTP(
                    GetOTP(registerMobile: mobileController.text),
                  )
                      .then((value) {
                    flag = int.parse(value.data);
                    print("===========================");
                    print(flag);
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => VerifyOTP(
                          registerMobile: mobileController.text,
                          otp: flag,
                        ),
                      ),
                    );
                  });
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