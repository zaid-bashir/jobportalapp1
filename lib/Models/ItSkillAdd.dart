class ItSkillAdd{
  String  requestType;
  int skillId;
  int candidateId;
  int candidateitskillVersion;
  int candidateitskillLastused;
  int candidateitskillExperience;

  ItSkillAdd({this.requestType,this.skillId,this.candidateId,this.candidateitskillVersion, this.candidateitskillLastused,
    this.candidateitskillExperience});



  Map<String, dynamic> toJson() {
    return {
      "requestType": requestType,
      "skillId": skillId,
      "candidateId": candidateId,
      "candidateitskillVersion": candidateitskillVersion,
      "candidateitskillLastused": candidateitskillLastused,
      "candidateitskillExperience": candidateitskillExperience
    };
  }
}