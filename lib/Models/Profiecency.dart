class Proficiency{
  String proficiencyId;
  String proficiencyName;


  Proficiency({this.proficiencyId,this.proficiencyName});

  factory Proficiency.fromJson(Map<String, dynamic>item){
    return Proficiency(
      proficiencyId: item["proficiencyId"],
      proficiencyName: item["proficiencyName"],
    );
  }
}