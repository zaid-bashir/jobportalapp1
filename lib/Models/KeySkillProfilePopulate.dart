class PopulateKeySkillsProfileModel {
  String candidatekeyskillUuid;
  int candidatekeyskilKeyskillId;
  String candidatekeyskillName;
  String keyskillName;

  PopulateKeySkillsProfileModel(
      {this.candidatekeyskillUuid,
        this.candidatekeyskilKeyskillId,
        this.candidatekeyskillName,
        this.keyskillName});

  PopulateKeySkillsProfileModel.fromJson(Map<String, dynamic> json) {
    candidatekeyskillUuid = json['candidatekeyskillUuid'];
    candidatekeyskilKeyskillId = json['candidatekeyskilKeyskillId'];
    candidatekeyskillName = json['candidatekeyskillName'];
    keyskillName = json['keyskillName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['candidatekeyskillUuid'] = candidatekeyskillUuid;
    data['candidatekeyskilKeyskillId'] = candidatekeyskilKeyskillId;
    data['candidatekeyskillName'] = candidatekeyskillName;
    data['keyskillName'] = keyskillName;
    return data;
  }
}
