class KeySkillAddDeleteOther {
  String requestType;
  String candidatekeyskilkeyskillId;
  String candidatekeyskillName;

  KeySkillAddDeleteOther(
      {this.requestType,
      this.candidatekeyskilkeyskillId,
      this.candidatekeyskillName});

  KeySkillAddDeleteOther.fromJson(Map<String, dynamic> json) {
    requestType = json['requestType'];
    candidatekeyskilkeyskillId = json['candidatekeyskilkeyskillId'];
    candidatekeyskillName = json['candidatekeyskillName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['requestType'] = requestType;
    data['candidatekeyskilkeyskillId'] = candidatekeyskilkeyskillId;
    data['candidatekeyskillName'] = candidatekeyskillName;
    return data;
  }
}
