class JobType{
  String  jobtypeId;
  String  jobtypeName;

  JobType({this.jobtypeId,this.jobtypeName});

  factory JobType.fromJson(Map<String,dynamic> item){
    return JobType(
        jobtypeId: item["jobtypeId"],
        jobtypeName: item["jobtypeName"]
    );
  }
}