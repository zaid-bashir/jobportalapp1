class OTPVerify{
  String registerMobile;
  int otp;

  OTPVerify({this.registerMobile,this.otp});

  OTPVerify.fromJson(Map<String,dynamic> json){
    registerMobile= json["registerMobile"];

  }

  Map<String,dynamic> toJson(){
    final Map<String,dynamic> data = <String,dynamic>{};
    data["registerMobile"] = registerMobile;
    data["otp"] = otp;
    return data;
  }
}