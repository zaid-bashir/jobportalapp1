class PostItSkills {
  String candidateUuid;
  int candidateitskillItskillId;
  int candidateitskillVersion;
  int candidateitskillLastused;
  int candidateitskillExperience;



  PostItSkills({this.candidateUuid, this.candidateitskillItskillId, this.candidateitskillVersion,
    this.candidateitskillLastused, this.candidateitskillExperience});

  Map<String, dynamic> toJson() {
    return {
      "candidateUuid": candidateUuid,
      "candidateitskillItskillId": candidateitskillItskillId,
      "candidateitskillVersion": candidateitskillVersion,
      "candidateitskillLastused": candidateitskillLastused,
      "candidateitskillExperience": candidateitskillExperience
    };
  }
}
