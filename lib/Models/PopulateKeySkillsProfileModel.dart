class PopulateKeySkillsProfileModel {
  int candidatekeyskilKeyskillId;
  String keyskillName;

  PopulateKeySkillsProfileModel(
      {this.candidatekeyskilKeyskillId, this.keyskillName});

  PopulateKeySkillsProfileModel.fromJson(Map<String, dynamic> json) {
    candidatekeyskilKeyskillId = json['CandidatekeyskilKeyskillId'];
    keyskillName = json['keyskillName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['CandidatekeyskilKeyskillId'] = candidatekeyskilKeyskillId;
    data['keyskillName'] = keyskillName;
    return data;
  }
}
