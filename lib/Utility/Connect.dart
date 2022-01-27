class Connect{
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
}