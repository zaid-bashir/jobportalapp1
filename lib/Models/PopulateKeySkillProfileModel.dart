class PopulateKeySkillsProfileModel {
  int keyskillId;
  String keySkillName;

  PopulateKeySkillsProfileModel({this.keyskillId, this.keySkillName});

  PopulateKeySkillsProfileModel.fromJson(Map<String, dynamic> json) {
    keyskillId = json['keyskillId'];
    keySkillName = json['keySkillName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['keyskillId'] = keyskillId;
    data['keySkillName'] = keySkillName;
    return data;
  }
}
