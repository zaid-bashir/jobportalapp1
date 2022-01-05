class Nationality{
  String countryId;
  String countryNationality;

  Nationality({this.countryId,this.countryNationality});

  factory Nationality.fromJson(Map<String,dynamic> item){
    return Nationality(
        countryId: item["countryId"],
        countryNationality: item["countryNationality"]
    );
  }
}