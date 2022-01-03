class JobType{
  String  jobtypeId;
  String  jobtypeName;

  JobType({this.jobtypeName,this.jobtypeId});

  factory JobType.fromJson(Map<String,dynamic> item){
    return JobType(
        jobtypeId: item["jobtypeId"],
        jobtypeName: item["jobtypeName"]
    );
  }
}