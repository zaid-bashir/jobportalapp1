import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:getwidget/getwidget.dart';
import 'package:job_portal/Data_Controller/apiresponse.dart';
import 'package:job_portal/Models/GetOtp.dart';
import 'package:job_portal/Services/ApiServices.dart';
import 'package:job_portal/Utility/Connect.dart';
import 'package:job_portal/Views/SignIn/Step1-VerifyOtp.dart';

class OTP extends StatefulWidget {
  const OTP({Key key}) : super(key: key);
  @override
  _OTPState createState() => _OTPState();
}

class _OTPState extends State<OTP> {
  bool isLoading = false;
  ApiServices apiServices = ApiServices();
  ApiResponse<dynamic> _apiResponse;
  FocusNode textSecondFocusNode;
  bool autoFocusToggle = true;

  //CountryCode and Country Flag
  //============================

  String countryCode = "";
  String flagUrl = "";

  fetchOTP({String mobileNumber, String countryCode}) async {
    setState(() {
      isLoading = true;
    });
    _apiResponse = await apiServices.otpGet(
        objGetOtp: GetOTP(registerMobile: mobileNumber),
        countryCode: countryCode);
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    textSecondFocusNode = FocusNode();
    Connect.checkInternetStatus();
  }

  void getValLength({int length}) {
    if (length == 10) {
      setState(() {
        autoFocusToggle = false;
      });
    } else {
      setState(() {
        autoFocusToggle = true;
      });
    }
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
              style: TextStyle(
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
              "Register with us to get new opportunities and climb up the career lader",
              style: TextStyle(
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Flexible(
                      flex: 3,
                      child: Container(
                        height: 47,
                        width: 90,
                        margin: const EdgeInsets.fromLTRB(0, 10, 3, 30),
                        decoration: const BoxDecoration(
                          border: Border(
                            bottom: BorderSide(color: Colors.grey),
                          ),
                        ),
                        child: Center(
                          child: CountryCodePicker(
                            onInit: (CountryCode obj) {
                              countryCode = obj.dialCode;
                              flagUrl = obj.flagUri;
                            },
                            enabled: true,
                            showFlag: true,
                            onChanged: (CountryCode obj) {
                              countryCode = obj.dialCode;
                              flagUrl = obj.flagUri;
                            },
                            initialSelection: 'IN',
                            favorite: const ['+91', 'IN'],
                            showCountryOnly: false,
                            showOnlyCountryWhenClosed: false,
                            alignLeft: false,
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
                          autofocus: autoFocusToggle,
                          focusNode: textSecondFocusNode,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.allow(RegExp("[0-9]"))
                          ],
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsetsDirectional.all(10),
                            hintText: "Enter Your Mobile Number",
                          ),
                          keyboardType: TextInputType.number,
                          autocorrect: true,
                          validator: (value) {
                            getValLength(length: value.length);
                            value.length == 10
                                ? setState(() {
                                    autoFocusToggle = false;
                                  })
                                : setState(() {
                                    autoFocusToggle = true;
                                  });
                            if (value.isEmpty) {
                              return "Mobile Number can not be empty";
                            }
                            if (value.length < 10) {
                              return "Enter 10 digits mobile number";
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
                // if (formKey.currentState.validate()) {
                await fetchOTP(
                    mobileNumber: mobileController.text,
                    countryCode: countryCode);
                if (_apiResponse.responseCode == 200) {
                  await Future.delayed(const Duration(seconds: 1),(){});
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => VerifyOTP(
                          countryCode: countryCode,
                          registerMobile: mobileController.text,
                          otp: _apiResponse.data,
                        ),
                      ),
                    );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Row(children: [
                      const Icon(
                        Icons.error_outline,
                        color: Colors.white,
                      ),
                      const SizedBox(width: 7),
                      Expanded(child: Text("${_apiResponse.data['message']}")),
                    ]),
                    backgroundColor: Colors.red,
                    duration: const Duration(milliseconds: 2500),
                  ));
                }
              },
              text: "Send OTP",
              type: GFButtonType.solid,
              blockButton: true,
            ),
          ),

        ],
      ),
    );
  }
}
