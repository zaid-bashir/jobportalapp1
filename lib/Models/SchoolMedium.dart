class Medium{
  String  schoolmediumId;
  String  schoolmediumName;

  Medium({this.schoolmediumId,this.schoolmediumName});

  factory Medium.fromJson(Map<String,dynamic> item){
    return Medium(
        schoolmediumId: item["schoolmediumId"],
        schoolmediumName: item["schoolmediumName"]
    );
  }
}