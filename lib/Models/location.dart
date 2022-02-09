class Cities{
  String cityId;
  String cityName;
  String hooks;

  Cities({this.cityId,this.cityName,this.hooks});

  factory Cities.fromJson(Map<String,dynamic> item){
    return Cities(
        cityId: item["cityId"],
        cityName: item["cityName"]
    );
  }
}