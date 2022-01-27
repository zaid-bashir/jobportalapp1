class BasicInfoPopulate {
  int candidateId;

  String candidateName;
  String candidateMobile1;
  String candidateEmail1;

  String candidateAddress;
  String candidateGenderName;

  String candidateJobroleName;

  String candidateCityName;
  String candidateTotalWorkExp;

  BasicInfoPopulate(
      {this.candidateId,
      this.candidateAddress,
      this.candidateName,
      this.candidateMobile1,
      this.candidateEmail1,
      this.candidateGenderName,
      this.candidateJobroleName,
      this.candidateCityName,
      this.candidateTotalWorkExp});

  factory BasicInfoPopulate.fromJson(Map<String, dynamic> item) {
    return BasicInfoPopulate(
        candidateId: item["candidateId"],
        candidateAddress: item["candidateAddress"],
        candidateName: item["candidateName"],
        candidateMobile1: item["candidateMobile1"],
        candidateEmail1: item["candidateEmail1"],
        candidateGenderName: item["candidateGenderName"],
        candidateJobroleName: item["candidateJobroleName"],
        candidateCityName: item["candidateCityName"],
        candidateTotalWorkExp: item["candidateTotalWorkExp"]);
  }
}
