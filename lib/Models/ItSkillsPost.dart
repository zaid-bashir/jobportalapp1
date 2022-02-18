class PostItSkills {
  String candidateitskillName;
  int candidateitskillVersion;
  int candidateitskillLastused;
  int candidateitskillExperience;

  PostItSkills(
      {
      this.candidateitskillName,
      this.candidateitskillVersion,
      this.candidateitskillLastused,
      this.candidateitskillExperience});

  Map<String, dynamic> toJson() {
    return {
      "candidateitskillName": candidateitskillName,
      "candidateitskillVersion": candidateitskillVersion,
      "candidateitskillLastused": candidateitskillLastused,
      "candidateitskillExperience": candidateitskillExperience
    };
  }
}
