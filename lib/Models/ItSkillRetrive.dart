class ItSkillProfile {
  int itskillId;
   String itskillName;
   int itSkillVersion;
   int candidateitskillLastused;
   String candidateitskillExperience;

  ItSkillProfile({this.itskillId,this.itskillName,this.itSkillVersion,this.candidateitskillLastused,this.candidateitskillExperience});

  factory ItSkillProfile.fromJson(Map<String,dynamic> item){
    return ItSkillProfile(
      itskillId: item["itskillId"],
      itskillName: item["itskillName"],
      itSkillVersion: item["itSkillVersion"],
      candidateitskillLastused: item["candidateitskillLastused"],
      candidateitskillExperience: item["candidateitskillExperience"],
    );
  }
}
