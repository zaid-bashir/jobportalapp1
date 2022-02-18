class GetProfileNoticePeriod{
  String noticePeriodId;
  String noticePeriodName;

  GetProfileNoticePeriod({this.noticePeriodId,this.noticePeriodName});

  GetProfileNoticePeriod.fromJson(Map<String,dynamic> json){
    noticePeriodId = json["noticePeriodId"];
    noticePeriodName = json["noticePeriodName"];
  }

  Map<String,dynamic> toJson(){
    final Map<String,dynamic> data = <String,dynamic>{};
    data["noticePeriodId"] = noticePeriodId;
    data["noticePeriodName"] = noticePeriodName;
    return data;
  }

}

