class RegisterError {
  String candidateEmail1;
  String candidateLastName;
  String candidateCurrentCityId;
  String candidateMobile1;
  String candidatePreferredJobRoleList;
  String candidateFirstName;
  String candidateGenderId;

  RegisterError(
      {this.candidateEmail1,
      this.candidateLastName,
      this.candidateCurrentCityId,
      this.candidateMobile1,
      this.candidatePreferredJobRoleList,
      this.candidateFirstName,
      this.candidateGenderId});

  RegisterError.fromJson(Map<String, String> json) {
    candidateEmail1 = json['candidateEmail1'];
    candidateLastName = json['candidateLastName'];
    candidateCurrentCityId = json['candidateCurrentCityId'];
    candidateMobile1 = json['candidateMobile1'];
    candidatePreferredJobRoleList = json['candidatePreferredJobRoleList'];
    candidateFirstName = json['candidateFirstName'];
    candidateGenderId = json['candidateGenderId'];
  }

  Map<String, String> toJson() {
    final Map<String, String> data = <String, String>{};
    data['candidateEmail1'] = candidateEmail1;
    data['candidateLastName'] = candidateLastName;
    data['candidateCurrentCityId'] = candidateCurrentCityId;
    data['candidateMobile1'] = candidateMobile1;
    data['candidatePreferredJobRoleList'] = candidatePreferredJobRoleList;
    data['candidateFirstName'] = candidateFirstName;
    data['candidateGenderId'] = candidateGenderId;
    return data;
  }
}
