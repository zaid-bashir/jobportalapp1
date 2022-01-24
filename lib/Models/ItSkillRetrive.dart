class ItSkillProfile {
   int candidateitskillItskillId;
   int candidateitskillVersion;
   int candidateitskillLastused;
   String candidateitskillExperience;
   String itskillName;

  ItSkillProfile({this.candidateitskillItskillId,this.candidateitskillVersion,this.candidateitskillLastused,this.candidateitskillExperience,
    this.itskillName});

  factory ItSkillProfile.fromJson(Map<String,dynamic> item){
    return ItSkillProfile(
      candidateitskillItskillId: item["candidateitskillItskillId"],
      candidateitskillVersion: item["candidateitskillVersion"],
      candidateitskillLastused: item["candidateitskillLastused"],
      candidateitskillExperience: item["candidateitskillExperience"],
      itskillName: item["itskillName"],
    );
  }
}
