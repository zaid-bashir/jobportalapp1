class KeySkills {
  String keyskillId;
  String keyskillName;

  KeySkills({this.keyskillId, this.keyskillName});

  KeySkills.fromJson(Map<String, dynamic> json) {
    keyskillId = json['keyskillId'];
    keyskillName = json['keyskillName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['keyskillId'] = keyskillId;
    data['keyskillName'] = keyskillName;
    return data;
  }
}
