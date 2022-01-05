class Country{
  String  countryId;
  String  countryName;

  Country({this.countryId,this.countryName});

  factory Country.fromJson(Map<String,dynamic> item){
    return Country(
        countryId: item["countryId"],
        countryName: item["countryName"]
    );
  }
}