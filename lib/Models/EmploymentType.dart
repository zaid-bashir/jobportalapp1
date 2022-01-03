class EmploymentType{
  String  employmenttypeId;
  String  employmenttypeName;

  EmploymentType({this.employmenttypeName,this.employmenttypeId});

  factory EmploymentType.fromJson(Map<String,dynamic> item){
    return EmploymentType(
        employmenttypeId: item["employmenttypeId"],
        employmenttypeName: item["employmenttypeName"]
    );
  }
}