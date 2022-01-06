class CurrentLocation {
  String cityId;
  String cityName;

  CurrentLocation({
    this.cityId,
    this.cityName,
  });

  factory CurrentLocation.fromJson(Map<String, dynamic> item) {
    return CurrentLocation(cityId: item["cityId"], cityName: item["cityName"]);
  }

  Map<String, dynamic> toJson() {
    return {
      "cityId": cityId,
      "cityName": cityName,
    };
  }
}
