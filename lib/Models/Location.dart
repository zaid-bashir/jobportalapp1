class Cities{
  String cityId;
  String cityName;

  Cities({this.cityId,this.cityName,});

  factory Cities.fromJson(Map<String,dynamic> item){
    return Cities(
        cityId: item["cityId"],
        cityName: item["cityName"]
    );
  }
}