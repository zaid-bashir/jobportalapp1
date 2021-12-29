import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:job_portal/Consts/apiurls.dart';
import 'package:job_portal/Data_Controller/apiresponse.dart';
import 'package:job_portal/Models/get_otp.dart';
import 'package:job_portal/Models/gettitle.dart';
import 'package:job_portal/Models/grading-system.dart';
import 'package:job_portal/Models/passing-year.dart';
import 'package:job_portal/Models/qualification-details.dart';
import 'package:job_portal/Models/verify_otp.dart';
import 'package:logger/logger.dart';

class ApiServices {
  var log = Logger();
  static String OTP = "";

  Future<ApiResponse<String>> getOTP(GetOTP objGetOtp) async {
    final url = Uri.parse(ApiUrls.kgetOTP);
    final headers = {
      "Content-Type": "application/json",
    };
    final jsonData = jsonEncode({"registerMobile": objGetOtp.registerMobile});
    final response = await http.post(url, headers: headers, body: jsonData);
    if (response.statusCode == 200 || response.statusCode == 201) {
      log.i(response.body);
      log.i(response.statusCode);
      return ApiResponse<String>(data: response.body);
    }
    return ApiResponse<String>(error: true, errorMessage: "An Error Occurred");
  }

  Future<ApiResponse<String>> verifyOTP(OTPVerify objOtpVerify) async {
    final url = Uri.parse(ApiUrls.kverifyOTP + "/${objOtpVerify.otp}");
    final headers = {
      "Content-Type": "application/json",
    };
    final jsonData = jsonEncode(OTPVerify.fromJson({
      "registerMobile": "${objOtpVerify.registerMobile}",
      "otp": objOtpVerify.otp
    }));
    final response = await http.post(url, headers: headers, body: jsonData);
    if (response.statusCode == 200 || response.statusCode == 201) {
      log.i(response.body);
      log.i(response.statusCode);
      return ApiResponse<String>(data: response.body);
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
      log.i(response.body);
      log.i(response.statusCode);
      print(list);
      return ApiResponse<List<GetTitle>>(data: list);
    }
    return ApiResponse<List<GetTitle>>(
        error: true, errorMessage: "An error occurred");
  }


  // PASSING YEAR DROPDOWN IN QUALIFICATION PAGE
  Future<ApiResponse<List<PassingYear>>> getPassingYear() async {
    final url = Uri.parse(ApiUrls.kPassingYear);
    final header = {
      "Content-Type": "application/json",
    };
    final response = await http.get(
      url,
      headers: header,
    );
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      final list = <PassingYear>[];
      for (var item in jsonData) {
        list.add(PassingYear.fromJson(item));
      }
      log.i(response.body);
      log.i(response.statusCode);
      print(list);
      return ApiResponse<List<PassingYear>>(data: list);
    }
    return ApiResponse<List<PassingYear>>(
        error: true, errorMessage: "An error occurred");
  }
  // GRADING DROPDOWN IN QUALIFICATION PAGE
  Future<ApiResponse<List<GradingSystem>>> getGradingSystem() async {
    final url = Uri.parse(ApiUrls.kGradingSystem);
    final header = {
      "Content-Type": "application/json",
    };
    final response = await http.get(
      url,
      headers: header,
    );
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      final list = <GradingSystem>[];
      for (var item in jsonData) {
        list.add(GradingSystem.fromJson(item));
      }
      log.i(response.body);
      log.i(response.statusCode);
      print(list);
      return ApiResponse<List<GradingSystem>>(data: list);
    }
    return ApiResponse<List<GradingSystem>>(
        error: true, errorMessage: "An error occurred");
  }
  // update


}
