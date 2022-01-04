class Marital {
  String maritalId;
  String maritalName;

  Marital({this.maritalId, this.maritalName});

   factory Marital.fromJson(Map<String, dynamic> json) {
    return Marital(
      maritalId: json["maritalId"],
      maritalName: json["maritalName"]
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['maritalId'] = this.maritalId;
    data['maritalName'] = this.maritalName;
    return data;
  }
}
