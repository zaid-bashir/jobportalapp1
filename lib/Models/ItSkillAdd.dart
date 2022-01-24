class ItSkillAdd{
  String  requestType;
  int candidateitskillItskillId;
  int candidateitskillCandidateId;
  int candidateitskillVersion;
  int candidateitskillLastused;
  int candidateitskillExperience;

  ItSkillAdd({this.requestType,this.candidateitskillItskillId,this.candidateitskillCandidateId,this.candidateitskillVersion, this.candidateitskillLastused,
    this.candidateitskillExperience});



  Map<String, dynamic> toJson() {
    return {
      "requestType": requestType,
      "candidateitskillItskillId": candidateitskillItskillId,
      "candidateitskillCandidateId": candidateitskillCandidateId,
      "candidateitskillVersion": candidateitskillVersion,
      "candidateitskillLastused": candidateitskillLastused,
      "candidateitskillExperience": candidateitskillExperience
    };
  }
}