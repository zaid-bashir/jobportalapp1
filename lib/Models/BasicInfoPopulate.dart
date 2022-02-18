

class BasicInfoPopulate {
  int candidateId;

  String candidateName;
  String candidateMobile1;
  String candidateEmail1;
   String candidateFirstName;
   String candidateMiddleName;
   String candidateLastName;
  String candidateAddress;
  String candidateGenderName;
String candidateGenderId;
  String candidateJobroleName;

  String candidateCityName;
  String candidateTotalWorkExp;

  BasicInfoPopulate(
      {this.candidateId,
      this.candidateAddress,
      this.candidateName,
        this.candidateFirstName,
      this.candidateMobile1,
      this.candidateEmail1,
      this.candidateGenderName,
        this.candidateGenderId,
      this.candidateJobroleName,
      this.candidateCityName,
      this.candidateTotalWorkExp,this.candidateMiddleName,this.candidateLastName});

  factory BasicInfoPopulate.fromJson(Map<String, dynamic> item) {
    return BasicInfoPopulate(
        candidateId: item["candidateId"],
        candidateAddress: item["candidateAddress"],
        candidateName: item["candidateName"],
        candidateMobile1: item["candidateMobile1"],
        candidateEmail1: item["candidateEmail1"],
        candidateGenderName: item["candidateGenderName"],
      candidateGenderId: item["candidateGenderId"],
        candidateJobroleName: item["candidateJobroleName"],
        candidateCityName: item["candidateCityName"],
        candidateTotalWorkExp: item["candidateTotalWorkExp"],
      candidateFirstName: item["candidateFirstName"],
      candidateMiddleName: item["candidateMiddleName"],
      candidateLastName: item["candidateLastName"],
    );
  }
}
