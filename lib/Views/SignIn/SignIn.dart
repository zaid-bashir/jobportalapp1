
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:job_portal/Data_Controller/apiresponse.dart';
import 'package:job_portal/Models/Login.dart';
import 'package:job_portal/Services/ApiServices.dart';
import 'package:job_portal/Utility/Connect.dart';
import 'package:job_portal/Views/Candidate/BottomNavbar.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:job_portal/Views/SignIn/Step1-Otp.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key key}) : super(key: key);
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isLoading = false;
  ApiServices apiServices = ApiServices();
  ApiResponse<String> apiResponse;

  var formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    Connect.checkInternetStatus();
  }

  fetchAuth({String username, String password}) async {
    setState(() {
      isLoading = true;
    });
    apiResponse =
    await apiServices.login(obj: Login(candidateEmail1: username,candidatePassword: password));
    setState(() {
      isLoading = false;
    });
  }

  TextEditingController usernameCont = TextEditingController();
  TextEditingController passwordCont = TextEditingController();

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
                                          return "Please enter your email";
                                        }
                                      },
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
                                          return "Please enter Password";
                                        } else {
                                          return null;
                                        }
                                      },
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
                  Container(
                    width: double.infinity,
                    child: GFButton(
                      color: Color(0xff3e61ed),
                      onPressed: () async {
                        if (formKey.currentState.validate()) {
                          print(usernameCont.text);
                          print(passwordCont.text);
                          fetchAuth(username: usernameCont.text,password: passwordCont.text);
                          print("Response Data : ${apiResponse.data}");
                          String val = "true";
                          bool b = val.toLowerCase() == apiResponse.data;
                          print(b);
                          if(b){
                            AwesomeDialog(
                              context: context,
                              animType: AnimType.SCALE,
                              dialogType: DialogType.ERROR,
                              title: 'JobPortalApp',
                              desc: 'Invalid User,Please enter your correct credentials',
                            ).show();
                          }else{
                            AwesomeDialog(
                              context: context,
                              animType: AnimType.SCALE,
                              dialogType: DialogType.SUCCES,
                              title: 'JobPortalApp',
                              desc: 'Successfully Logged In...',
                              btnOkOnPress: (){
                                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Navbar(),),);
                              },
                            ).show();
                          }
                        } else {
                          AwesomeDialog(
                            context: context,
                            animType: AnimType.SCALE,
                            dialogType: DialogType.ERROR,
                            title: 'JobPortalApp',
                            desc: 'Please enter your correct credentials',
                          ).show();
                        }
                      },
                      text: "Login",
                      textStyle: TextStyle(
                        color: Colors.white,
                        fontFamily: "ProximaNova",
                        fontWeight: FontWeight.bold,
                        // letterSpacing: 1.5,
                        fontSize: 14.5,
                      ),
                    ),
                  ),
                  SizedBox(
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
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const OTP()));
                        },
                        child: Text(
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
                // Navigator.push(context, MaterialPageRoute(builder: (context)=>PersonalDetails()));
                // Navigator.push(context, MaterialPageRoute(builder: (context)=>WorkingProfession()));
              ),
            ),
          )),
    );
  }
}
