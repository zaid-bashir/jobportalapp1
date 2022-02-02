class KeySkillDeleteProfile {
  String requestType;
  String candidatekeyskillUuid;

  KeySkillDeleteProfile({this.requestType, this.candidatekeyskillUuid});

  KeySkillDeleteProfile.fromJson(Map<String, dynamic> json) {
    requestType = json['requestType'];
    candidatekeyskillUuid = json['candidatekeyskillUuid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['requestType'] = requestType;
    data['candidatekeyskillUuid'] = candidatekeyskillUuid;
    return data;
  }
}
