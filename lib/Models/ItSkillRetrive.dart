class ItSkillProfile {
  String requestType;
  int candidateId;
  int itskillId;
  String itkillName;

  ItSkillProfile({this.requestType,this.candidateId,this.itskillId,this.itkillName});

  factory ItSkillProfile.fromJson(Map<String,dynamic> item){
    return ItSkillProfile(
      requestType: item["requestType"],
      candidateId: item["candidateId"],
      itskillId: item["itskillId"],
      itkillName: item["itkillName"],
    );
  }
}
