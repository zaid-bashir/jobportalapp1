class KeySkillAddProfile {
  String requestType;
  String candidatekeyskillName;

  KeySkillAddProfile({this.requestType, this.candidatekeyskillName});

  KeySkillAddProfile.fromJson(Map<String, dynamic> json) {
    requestType = json['requestType'];
    candidatekeyskillName = json['candidatekeyskillName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['requestType'] = requestType;
    data['candidatekeyskillName'] = candidatekeyskillName;
    return data;
  }
}
