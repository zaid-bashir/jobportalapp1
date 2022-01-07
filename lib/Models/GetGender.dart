class GetGender{
  String genderId ;
  String genderName;

  GetGender({this.genderId,this.genderName});

  GetGender.fromJson(Map<String,dynamic> json){
    genderId = json["genderId"];
    genderName = json["genderName"];
  }

  Map<String,dynamic> toJson(){
    final Map<String,dynamic> data = <String,dynamic>{};
    data["genderId"] = genderId;
    data["genderName"] = genderName;
    return data;
  }

}