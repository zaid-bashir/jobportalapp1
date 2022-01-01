import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:job_portal/Models/JobCategory.dart';
import 'package:job_portal/Utility/ApiUrls.dart';
import 'package:job_portal/Data_Controller/apiresponse.dart';
import 'package:job_portal/Models/GetOtp.dart';
import 'package:job_portal/Models/GetGender.dart';
import 'package:job_portal/Models/GetShift.dart';
import 'package:job_portal/Models/GetTitle.dart';
import 'package:job_portal/Models/GradingSystem.dart';
import 'package:job_portal/Models/PassingYear.dart';
import 'package:job_portal/Models/VerifyOtp.dart';
import 'package:logger/logger.dart';

class ApiServices {

  var log = Logger();

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
      log.i(response.body);
      log.i(response.statusCode);
      print(list);
      return ApiResponse<List<GetTitle>>(data: list);
    }
    return ApiResponse<List<GetTitle>>(
        error: true, errorMessage: "An error occurred");
  }

  Future<ApiResponse<List<JobCategory>>> getJobCategory(String name) async {
    final url = Uri.parse(ApiUrls.kJobCategory + name);
    final header = {
      "Content-Type": "application/json",
    };
    final response = await http.get(
      url,
      headers: header,
    );
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      final list = <JobCategory>[];
      for (var item in jsonData) {
        list.add(JobCategory.fromJson(item));
      }
      log.i(response.body);
      log.i(response.statusCode);
      print(list);
      return ApiResponse<List<JobCategory>>(data: list);
    }
    return ApiResponse<List<JobCategory>>(
        error: true, errorMessage: "An error occurred");
  }

  Future<ApiResponse<List<GetGender>>> getGender () async {
    final url = Uri.parse(ApiUrls.kgender);
    final header = {
      "Content-Type": "application/json",
    };
    final response = await http.get(
      url,
      headers: header,
    );
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      final list = <GetGender>[];
      for (var item in jsonData) {
        list.add(GetGender.fromJson(item));
      }
      log.i(response.body);
      log.i(response.statusCode);
      print(list);
      return ApiResponse<List<GetGender>>(data: list);
    }
    return ApiResponse<List<GetGender>>(
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


  // PREFERRED SHIFT IN CAREER PREFERENCES//
  Future<ApiResponse<List<PreferredShift>>> getShift() async {
    final url = Uri.parse(ApiUrls.kShift);
    final header = {
      "Content-Type": "application/json",
    };
    final response = await http.get(
      url,
      headers: header,
    );
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      final list = <PreferredShift>[];
      for (var item in jsonData) {
        list.add(PreferredShift.fromJson(item));
      }
      log.i(response.body);
      log.i(response.statusCode);
      print(list);
      return ApiResponse<List<PreferredShift>>(data: list);
    }
    return ApiResponse<List<PreferredShift>>(
        error: true, errorMessage: "An error occurred");
  }

}
