// ignore_for_file: avoid_print

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:getwidget/components/button/gf_button.dart';
import 'package:job_portal/Data_Controller/apiresponse.dart';
import 'package:job_portal/Models/Login.dart';
import 'package:job_portal/Models/ShowDataLogin.dart';
import 'package:job_portal/Services/ApiServices.dart';
import 'package:job_portal/Utility/Connect.dart';
import 'package:job_portal/Utility/apiurls.dart';
import 'package:job_portal/Views/Candidate/BottomNavbar.dart';
import 'package:job_portal/Views/SignIn/Step1-Otp.dart';
import 'package:flutter_otp_timer/flutter_otp_timer.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key key}) : super(key: key);
  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  bool isLoading = false;
  ApiServices apiServices = ApiServices();
  ApiResponse<ShowDataLogin> apiResponse;
  ApiResponse<String> apiGetResponseFromServer;

  //Get SharedPreference Bucket
  //===========================

  SharedPreferences prefLogin;

  //Shared Preference Variables
  //===========================

  String sharedPrefJwt = "";

  //Shared Preference Keys
  //======================

  String keyJwt = "keyJwt";
  String keyEmail = "keyEmail";
  String keyUsername = "keyUsername";
  bool changeColor = false;

  var formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    getResponseFromServer();
    Connect.checkInternetStatus();
    initSharedPreference();
  }

  initSharedPreference() async {
    prefLogin = await SharedPreferences.getInstance();
  }

  fetchAuth({String username, String password}) async {
    setState(() {
      isLoading = true;
    });
    apiResponse = await apiServices.login(
        obj: Login(candidateEmail1: username, candidatePassword: password));
    setState(() {
      isLoading = false;
    });
  }

  TextEditingController usernameCont = TextEditingController();
  TextEditingController passwordCont = TextEditingController();

  @override
  Widget build(BuildContext context) {
    getResponseFromServer();
    return SafeArea(
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: changeColor ? Colors.white :Colors.cyan,
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        "Login to your\naccount ",
                        style: TextStyle(
                          fontFamily: "OpenSans",
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.5,
                          fontSize: 20.5,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Form(
                            key: formKey,
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextFormField(
                                      controller: usernameCont,
                                      validator: (value) {
                                        if (EmailValidator.validate(value)) {
                                          return null;
                                        } else {
                                          return "Enter Email";
                                        }
                                      },
                                      decoration: const InputDecoration(
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
                                          color: Color(0xff3e61ed),
                                          fontFamily: "ProximaNova",
                                          fontWeight: FontWeight.bold,
                                          // letterSpacing: 1.5,
                                          fontSize: 17.5,
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0xff3e61ed),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextFormField(
                                      controller: passwordCont,
                                      obscureText: true,
                                      validator: (value) {
                                        if (value.isEmpty) {
                                          return "Enter Password";
                                        } else {
                                          return null;
                                        }
                                      },
                                      decoration: const InputDecoration(
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
                                            color: Color(0xff2972ff),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          'Forgot Password?',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 14.0,
                              fontWeight: FontWeight.w400),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: GFButton(
                      color: const Color(0xff3e61ed),
                      onPressed: () async {
                        if (formKey.currentState.validate()) {
                          await fetchAuth(
                              username: usernameCont.text,
                              password: passwordCont.text);
                          print(
                              "Response Data : ${apiResponse.data.toString()}");
                          if (apiResponse.responseCode == 200) {
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Navbar(),
                                ),
                                (route) => false);
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Row(children: const [
                                Icon(
                                  Icons.error_outline,
                                  color: Colors.white,
                                ),
                                SizedBox(width: 7),
                                Expanded(
                                  child: Text(
                                      "Invalid User, Enter Your Correct Credentials..."),
                                ),
                              ]),
                              backgroundColor: Colors.red,
                              duration: const Duration(milliseconds: 2500),
                            ));
                          }
                        }
                      },
                      text: "Login",
                      textStyle: const TextStyle(
                        color: Colors.white,
                        fontFamily: "ProximaNova",
                        fontWeight: FontWeight.bold,
                        // letterSpacing: 1.5,
                        fontSize: 14.5,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Don\'t have an account?',
                        style: TextStyle(
                            color: Colors.grey.shade600,
                            fontSize: 14.0,
                            fontWeight: FontWeight.w400),
                      ),
                      OtpTimer(
                        duration:
                            60, // time till which the timer should animate
                        radius: 10, // size of the circle
                        timeTextSize: 16, // time text inside the circle
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const OTP()));
                        },
                        child: const Text(
                          'Register',
                          style: TextStyle(
                              color: Color(0xff2972ff),
                              fontSize: 14.0,
                              fontWeight: FontWeight.w400),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          )),
    );
  }

  Future<ApiResponse<String>> getResponseFromServer() async {
    // var parsedUrl = Uri.parse(ApiUrls.kgetResponseFromServer);
    // var response = await http.get(parsedUrl);
    // if(response.statusCode == 200){
    //    return ApiResponse<String>(
    //       data: response.body,responseCode: response.statusCode,error: false,errorMessage: "SuccessfullyConnected with our Backend Services");
    // }else{
    //    return ApiResponse<String>(
    //       data: response.body,responseCode: response.statusCode,error: false,errorMessage: "Currently Server is Busy, try again Later");
    // }
    await http.get(Uri.parse(ApiUrls.kgetResponseFromServer)).timeout(
      const Duration(seconds: 1),
      // ignore: missing_return
      onTimeout: (){
        setState(() {
          changeColor = true;
        });
        print("Clusttech Innovations Srinagar");
      },
    );
  }

  void storeLoginDataToSharedPref() async {
    await prefLogin.setString(keyJwt, apiResponse.data.token);
    await prefLogin.setString(keyEmail, apiResponse.data.candidateEmail);
    await prefLogin.setString(keyUsername, apiResponse.data.candidateName);
  }
}
