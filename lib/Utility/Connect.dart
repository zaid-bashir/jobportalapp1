import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:overlay_support/overlay_support.dart';

class Connect{

  static bool hasInternet = false;
  static bool checkOtpLength(int otp){
    int length = 0;
    int receivedOtp = otp;
    while(receivedOtp > 0){
      receivedOtp = (receivedOtp / 10).floor();
      length++;
    }
    if(length == 6){
      return true;
    }else{
      return false;
    }
  }

  static   void checkInternetStatus() async {
    hasInternet = await InternetConnectionChecker().hasConnection;
    final color = hasInternet ? Colors.green : Colors.red;
    final text =
    hasInternet ? "Connected with Internet" : "Disconnected from Internet";
    showSimpleNotification(
      Text(
        text,
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
        ),
      ),
      background: color,
    );
  }

}