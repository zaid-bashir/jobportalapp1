// ignore_for_file: avoid_print, non_constant_identifier_names, unused_local_variable, unnecessary_string_interpolations

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:job_portal/Consts/apiurls.dart';
import 'package:job_portal/Data_Controller/apiresponse.dart';
import 'package:job_portal/Models/get_otp.dart';
import 'package:job_portal/Models/gettitle.dart';
import 'package:job_portal/Models/verify_otp.dart';

class ApiServices {
  Future<ApiResponse<int>> getOTP(GetOTP objGetOtp) async {
    final url = Uri.parse(ApiUrls.kgetOTP);
    final headers = {
      "Content-Type": "application/json",
    };
    final jsonData = jsonEncode({"registerMobile": objGetOtp.registerMobile});
    final response = await http.post(url, headers: headers, body: jsonData);
    if (response.statusCode == 200 || response.statusCode == 201) {
      final jsonData = jsonDecode(response.body);
      final int data = jsonData;
      print(data);
      return ApiResponse<int>(data: data);
    }
    return ApiResponse<int>(
        error: true,
        errorMessage: "Failed to Receive the OTP, Please try Again");
  }

  Future<ApiResponse<String>> otpVerify(OTPVerify objOtpVerify) async {
    final url = Uri.parse(ApiUrls.kverifyOTP+"/"+"${objOtpVerify.otp}");
    final headers = {
      "Content-Type": "application/json",
    };
    final jsonData = jsonEncode(OTPVerify.fromJson({
      "registerMobile": "${objOtpVerify.registerMobile}",
      "otp": objOtpVerify.otp
    }));
    final response = await http.post(url, headers: headers, body: jsonData);
    if (response.statusCode == 200 || response.statusCode == 201) {
      final jsonData = jsonDecode(response.body);
      final String data = jsonData;
      return ApiResponse<String>(data: data);
    }
    return ApiResponse<String>(error: true, errorMessage: "An Error Occurred");
  }

  Future<ApiResponse<List<GetTitle>>> getTitle() async {
    final url = Uri.parse(ApiUrls.ktitles);
    final header = {
      "Content-Type": "application/json",
    };
    final response = await http.get(
      url,
      headers: header,
    );
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      final list = <GetTitle>[];
      for (var item in jsonData) {
        list.add(GetTitle.fromJson(item));
      }
      print(list);
      return ApiResponse<List<GetTitle>>(data: list);
    }
    return ApiResponse<List<GetTitle>>(
        error: true, errorMessage: "An error occurred");
  }
}
