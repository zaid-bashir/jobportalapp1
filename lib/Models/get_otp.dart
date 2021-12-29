class GetOTP{
  String registerMobile;

  GetOTP({this.registerMobile});

  GetOTP.fromJson(Map<String,dynamic> json){
    registerMobile = json["registerMobile"];
  }

  Map<String,dynamic> toJson(){
    final Map<String,dynamic> data = <String,dynamic>{};
    data["registerMobile"] = registerMobile;
    return data;
  }
}