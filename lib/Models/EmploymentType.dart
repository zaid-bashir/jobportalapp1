class EmploymentType{
  int  employmenttypeId;
  String  employmenttypeName;
  bool value = false;
  EmploymentType({this.employmenttypeId,this.employmenttypeName,this.value});

  factory EmploymentType.fromJson(Map<String,dynamic> item){
    return EmploymentType(
        employmenttypeId: item["employmenttypeId"],
        employmenttypeName: item["employmenttypeName"]
    );
  }
}