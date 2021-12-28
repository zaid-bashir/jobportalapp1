// ignore_for_file: avoid_print, non_constant_identifier_names

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:job_portal/Data_Controller/apiresponse.dart';
import 'package:job_portal/Models/get_otp.dart';
import 'package:job_portal/Models/title.dart';
import 'package:job_portal/consts/apiurls.dart';

class ApiServices {

    static String OTP="";

    Future<ApiResponse<bool>> getOTP(GetOTP obj) async {
    final url = Uri.parse(ApiUrls.kgetOTP);
    final headers = {
      "Content-Type": "application/json",
    };
    final jsonData = jsonEncode({"registerMobile" : obj.mobileNo});
    final response = await http.post(url, headers: headers, body: jsonData);
    if (response.statusCode == 200 || response.statusCode == 201) {
      print(response.body);
      return ApiResponse<bool>(data: true);
    }
    return ApiResponse<bool>(error: true, errorMessage: "An Error Occurred");
  }

  //SERVICE FOR TITLE STARTS HERE

    Future<ApiResponse<Map<String,String>>> getTitle() async {
      final url = Uri.parse(ApiUrls.kgetTitle);
      final headers = {
        "Content-Type": "application/json",
      };

      final response = await http.get(url, headers: headers);
      Map<String,String> titles = {};
      if (response.statusCode == 200 ) {
        titles = jsonDecode(response.body);
        print(titles);
        print(titles.runtimeType);
        return ApiResponse<Map<String,String>>(data: titles);
      }
      return ApiResponse<Map<String,String>>(error: true, errorMessage: "An Error Occurred");
    }

//SERVICE FOR TITLE ENDS HERE

}
