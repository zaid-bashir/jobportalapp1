class GradingSystem{
  String gradingsystemId;
  String gradingsystemName;

  GradingSystem({this.gradingsystemName,this.gradingsystemId});


  factory GradingSystem.fromJson(Map<String, dynamic> item) {
    return GradingSystem(

        gradingsystemId: item["gradingsystemId"],
        gradingsystemName: item["gradingsystemName"]
    );

  }
}