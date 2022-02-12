  class PostKeySkills {
  String candidateUuid;
  int candidatekeyskilKeyskillId;
  PostKeySkills({this.candidateUuid, this.candidatekeyskilKeyskillId});
  PostKeySkills.fromJson(Map<String, dynamic> json) {
    candidateUuid = json['candidateUuid'];
    candidatekeyskilKeyskillId = json['candidatekeyskilKeyskillId'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['candidateUuid'] = candidateUuid;
    data['candidatekeyskilKeyskillId'] = candidatekeyskilKeyskillId;
    return data;
  }
}
