class PostItSkills {
  int candidiateitskillCandidateId;
  int candidiateitskillItskillId;
  int candidiateitskillVersion;
  int candidiateitskillLastused;
  int candidiateitskillExperience;



  PostItSkills({this.candidiateitskillCandidateId, this.candidiateitskillItskillId, this.candidiateitskillVersion,
    this.candidiateitskillLastused, this.candidiateitskillExperience});

  Map<String, dynamic> toJson() {
    return {
      "candidiateitskillCandidateId": candidiateitskillCandidateId,
      "candidiateitskillItskillId": candidiateitskillItskillId,
      "candidiateitskillVersion": candidiateitskillVersion,
      "candidiateitskillLastused": candidiateitskillLastused,
      "candidiateitskillExperience": candidiateitskillExperience
    };
  }
}
