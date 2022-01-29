// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:overlay_support/overlay_support.dart';

class Connect {
  static bool hasInternet = false;

  static String AppRun() {
    String state = "0";
    return state;
  }

  static String AppURL() {
    String baseURL;
    if (AppRun() == "0") {
      baseURL = "http://192.168.0.20:9030/jobportal-app/api/";
    } else if (AppRun() == "1") {
      baseURL = "http://xxx.xxx.xxx.xxx:9030/jobportal-app/api/";
    }
    return baseURL;
  }

  static bool checkOtpLength(int otp) {
    int length = 0;
    int receivedOtp = otp;
    while (receivedOtp > 0) {
      receivedOtp = (receivedOtp / 10).floor();
      length++;
    }
    if (length == 6) {
      return true;
    } else {
      return false;
    }
  }

  static void checkInternetStatus() async {
    hasInternet = await InternetConnectionChecker().hasConnection;
    final color = hasInternet ? Colors.green : Colors.red;
    final text =
        hasInternet ? "Connected with Internet" : "Disconnected from Internet";
    showSimpleNotification(
      Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16,
        ),
      ),
      background: color,
    );
  }
}
