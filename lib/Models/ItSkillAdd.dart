class ItSkillAdd{
  String  requestType;
  String candidateitskillUuid;
  int candidateitskillItskillId;
  int candidateitskillCandidateId;
  double candidateitskillVersion;
  int candidateitskillLastused;
  int candidateitskillExperience;
  String candidateitskillName;

  ItSkillAdd({this.candidateitskillUuid,this.candidateitskillName,this.requestType,this.candidateitskillItskillId,this.candidateitskillCandidateId,this.candidateitskillVersion, this.candidateitskillLastused,
    this.candidateitskillExperience});



  Map<String, dynamic> toJson() {
    return {
      "requestType": requestType,
      "candidateitskillUuid": candidateitskillUuid,
      "candidateitskillItskillId": candidateitskillItskillId,
      "candidateitskillName": candidateitskillName,
      "candidateitskillCandidateId": candidateitskillCandidateId,
      "candidateitskillVersion": candidateitskillVersion,
      "candidateitskillLastused": candidateitskillLastused,
      "candidateitskillExperience": candidateitskillExperience
    };
  }
}