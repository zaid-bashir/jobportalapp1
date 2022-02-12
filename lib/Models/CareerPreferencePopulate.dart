class CareerPreferencePopulate {
  String industryName;
  List<String> jobtypeName;
  List<String> employmenttypeName;
  String cityName;
  String candidateExpectedctc;
  String shiftName;
  String candidateJoindate;

  CareerPreferencePopulate(
      {this.industryName,
        this.jobtypeName,
        this.employmenttypeName,
        this.cityName,
        this.candidateExpectedctc,
        this.shiftName,
        this.candidateJoindate});

  CareerPreferencePopulate.fromJson(Map<String, dynamic> json) {
    industryName = json['industryName'];
    jobtypeName = json['jobtypeName'].cast<String>();
    employmenttypeName = json['employmenttypeName'].cast<String>();
    cityName = json['cityName'];
    candidateExpectedctc = json['candidateExpectedctc'];
    shiftName = json['shiftName'];
    candidateJoindate = json['candidateJoindate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['industryName'] = industryName;
    data['jobtypeName'] = jobtypeName;
    data['employmenttypeName'] = employmenttypeName;
    data['cityName'] = cityName;
    data['candidateExpectedctc'] = candidateExpectedctc;
    data['shiftName'] = shiftName;
    data['candidateJoindate'] = candidateJoindate;
    return data;
  }
}

