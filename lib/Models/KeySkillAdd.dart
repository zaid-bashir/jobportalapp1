class KeySkillAdd {
  String requestType;
  int skillId;
  int candidateId;

  KeySkillAdd({this.requestType, this.skillId, this.candidateId});

  KeySkillAdd.fromJson(Map<String, dynamic> json) {
    requestType = json['requestType'];
    skillId = json['skillId'];
    candidateId = json['candidateId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['requestType'] = requestType;
    data['skillId'] = skillId;
    data['candidateId'] = candidateId;
    return data;
  }
}
