class ItSkillProfile {
  int candidateitskillItskillId;
  String candidateitskillVersion;
  String candidateitskillUuid;
  String candidateitskillLastused;
  String candidateitskillExperience;
  String itskillName;
  String candidateitskillName;

  int candidateitskillExperienceYears;
  int candidateitskillExperienceMonths;

  ItSkillProfile(
      {this.candidateitskillItskillId,
        this.candidateitskillUuid,
        this.candidateitskillName,
      this.candidateitskillVersion,
      this.candidateitskillLastused,
      this.candidateitskillExperience,
      this.itskillName,
      this.candidateitskillExperienceYears,
      this.candidateitskillExperienceMonths});

  factory ItSkillProfile.fromJson(Map<String, dynamic> item) {
    return ItSkillProfile(
      candidateitskillItskillId: item["candidateitskillItskillId"],
      candidateitskillName: item["candidateitskillName"],
      candidateitskillUuid: item["candidateitskillUuid"],
      candidateitskillVersion: item["candidateitskillVersion"],
      candidateitskillLastused: item["candidateitskillLastused"],
      candidateitskillExperience: item["candidateitskillExperience"],
      itskillName: item["itskillName"],
      candidateitskillExperienceYears: item["candidateitskillExperienceYears"],
      candidateitskillExperienceMonths: item["candidateitskillExperienceMonths"],
    );
  }
}
