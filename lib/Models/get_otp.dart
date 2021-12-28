class GetOTP{
  String mobileNo;

  GetOTP({this.mobileNo});

  GetOTP.fromJson(Map<String,dynamic> json){
    mobileNo = json["mobileNo"];
  }

  Map<String,dynamic> toJson(){
    final Map<String,dynamic> data = <String,dynamic>{};
    data["mobileNo"] = mobileNo;
    return data;
  }

}