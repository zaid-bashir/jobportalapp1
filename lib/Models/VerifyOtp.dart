class OTPVerify{
  String registerMobile;
  dynamic otp;

  OTPVerify({this.registerMobile,this.otp});

  OTPVerify.fromJson(Map<String,dynamic> json){
    registerMobile= json["registerMobile"];
    otp = json["otp"];
  }

  Map<String,dynamic> toJson(){
    final Map<String,dynamic> data = <String,dynamic>{};
    data["registerMobile"] = registerMobile;
    data["otp"] = otp;
    return data;
  }
}