class GetTitle{
  String titleId;
  String titleDesc;

  GetTitle({this.titleId,this.titleDesc});

    GetTitle.fromJson(Map<String,dynamic> json){
    titleId = json["titleId"];
    titleDesc = json["titleDesc"];
  }

  Map<String,dynamic> toJson(){
    final Map<String,dynamic> data = <String,dynamic>{};
    data["titleId"] = titleId;
    data["titleDesc"] = titleDesc;
    return data;
  }

}