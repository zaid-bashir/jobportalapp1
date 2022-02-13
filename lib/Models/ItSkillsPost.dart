class PostItSkills {
  String candidateUuid;
  String candidateitskillName;
  double candidateitskillVersion;
  int candidateitskillLastused;
  int candidateitskillExperience;



  PostItSkills({this.candidateUuid, this.candidateitskillName, this.candidateitskillVersion,
    this.candidateitskillLastused, this.candidateitskillExperience});

  Map<String, dynamic> toJson() {
    return {
      "candidateUuid": candidateUuid,
      "candidateitskillName": candidateitskillName,
      "candidateitskillVersion": candidateitskillVersion,
      "candidateitskillLastused": candidateitskillLastused,
      "candidateitskillExperience": candidateitskillExperience
    };
  }
}
