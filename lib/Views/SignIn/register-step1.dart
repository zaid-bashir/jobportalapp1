// ignore_for_file: prefer_const_constructors, unnecessary_const, unused_field, unnecessary_new, curly_braces_in_flow_control_structures, sized_box_for_whitespace

import 'dart:async';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_verification_code/flutter_verification_code.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:getwidget/getwidget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:job_portal/Views/SignIn/register-step2.dart';
import 'package:job_portal/Views/SignIn/signinotp.dart';

class RegisterStep1 extends StatefulWidget {
  const RegisterStep1({Key key}) : super(key: key);

  @override
  _RegisterStep1State createState() => _RegisterStep1State();
}

class _RegisterStep1State extends State<RegisterStep1> {
  int currentStep = 0;
  var formKey = GlobalKey<FormState>();
  var mobileController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 40, bottom: 40, left: 10),
            child: Text(
              "Let\'s Create Your Account - Step 1",
              textAlign: TextAlign.left,
              style: GoogleFonts.lato(
                textStyle: TextStyle(fontSize: 28, fontWeight: FontWeight.w900),
              ),
            ),
          ),
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
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Center(
            child: Text(
              "Enter Your Mobile Number we will send you OTP to Verify",
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
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
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(color: Colors.grey),
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
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey, width: 1),
                        ),
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
          SizedBox(
            height: 20,
          ),
           Padding(
             padding: const EdgeInsets.all(10.0),
             child: GFButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Verification(),),);
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
