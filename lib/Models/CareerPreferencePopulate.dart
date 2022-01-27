class PopulateCareerPreferenceProfileModel {
  String industryName;
  String jobtypeName;
  String employmenttypeName;
  String cityName;
  String candidateExpectedctc;
  String shiftName;
  String candidateJoindate;

  PopulateCareerPreferenceProfileModel(
      {this.industryName,
        this.jobtypeName,
        this.employmenttypeName,
        this.cityName,
        this.candidateExpectedctc,
        this.shiftName,
        this.candidateJoindate});

  PopulateCareerPreferenceProfileModel.fromJson(Map<String, dynamic> json) {
    industryName = json['industryName'];
    jobtypeName = json['jobtypeName'];
    employmenttypeName = json['employmenttypeName'];
    cityName = json['cityName'];
    candidateExpectedctc = json['candidateExpectedctc'];
    shiftName = json['shiftName'];
    candidateJoindate = json['candidateJoindate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['industryName'] = this.industryName;
    data['jobtypeName'] = this.jobtypeName;
    data['employmenttypeName'] = this.employmenttypeName;
    data['cityName'] = this.cityName;
    data['candidateExpectedctc'] = this.candidateExpectedctc;
    data['shiftName'] = this.shiftName;
    data['candidateJoindate'] = this.candidateJoindate;
    return data;
  }
}
