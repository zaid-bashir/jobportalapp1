class PostItSkills {
  String candidateUuid;
  int candidiateitskillItskillId;
  int candidiateitskillVersion;
  int candidiateitskillLastused;
  int candidiateitskillExperience;



  PostItSkills({this.candidateUuid, this.candidiateitskillItskillId, this.candidiateitskillVersion,
    this.candidiateitskillLastused, this.candidiateitskillExperience});

  Map<String, dynamic> toJson() {
    return {
      "candidateUuid": candidateUuid,
      "candidiateitskillItskillId": candidiateitskillItskillId,
      "candidiateitskillVersion": candidiateitskillVersion,
      "candidiateitskillLastused": candidiateitskillLastused,
      "candidiateitskillExperience": candidiateitskillExperience
    };
  }
}
