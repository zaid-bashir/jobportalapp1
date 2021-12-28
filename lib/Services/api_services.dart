// ignore_for_file: avoid_print, non_constant_identifier_names, unused_local_variable, unnecessary_string_interpolations

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:job_portal/Data_Controller/apiresponse.dart';
import 'package:job_portal/Models/get_otp.dart';
import 'package:job_portal/Models/verify_otp.dart';
import 'package:job_portal/consts/apiurls.dart';

class ApiServices {

    static String OTP="";

    Future<ApiResponse<String>> getOTP(GetOTP objGetOtp) async {
    final url = Uri.parse(ApiUrls.kgetOTP);
    final headers = {
      "Content-Type": "application/json",
    };
    final jsonData = jsonEncode({"registerMobile" : objGetOtp.registerMobile});
    final response = await http.post(url, headers: headers, body: jsonData);
    if (response.statusCode == 200 || response.statusCode == 201) {
      print(response.body);
      return ApiResponse<String>(data: response.body);
    }
    return ApiResponse<String>(error: true, errorMessage: "An Error Occurred");
  
  }

  Future<ApiResponse<String>> verifyOTP(OTPVerify objOtpVerify) async{
    final url = Uri.parse(ApiUrls.kverifyOTP+"/${objOtpVerify.otp}");
    final headers = {
      "Content-Type": "application/json",
    };
    final jsonData = jsonEncode(OTPVerify.fromJson({"registerMobile" : "${objOtpVerify.registerMobile}","otp" : objOtpVerify.otp}));
    final response = await http.post(url, headers: headers, body: jsonData);
    if (response.statusCode == 200 || response.statusCode == 201) {
      print(response.body);
      return ApiResponse<String>(data: response.body);
    }
    return ApiResponse<String>(error: true, errorMessage: "An Error Occurred");
  
  }

}
