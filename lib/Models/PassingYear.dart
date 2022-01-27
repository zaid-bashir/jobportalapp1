class PassingYear{
  String  yearId;
  String  yearName;

  PassingYear({this.yearName,this.yearId});

  factory PassingYear.fromJson(Map<String,dynamic> item){
    return PassingYear(
      yearId: item["yearId"],
      yearName: item["yearName"]
    );
  }
}