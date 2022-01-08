class PersonalDetailsPost {
  int candidateId;
  String candidateAddress;
  int candidateCityId;
  String candidatePin;
  DateTime candidateDob;
  int candidateMaritalstatusId;
  int candidatecasteId;
  String candidateExservicemen;
  int candidateExservicemenExp;
  String candidateDifferentlyAbled;
  String candidateDisabilitType;
  String candidateDisabilityAssistance;
  String candidatePancard;
  int candidateNationalityId;
  String candidatePassportno;
  int candidateWorkpermitcountryId;

  PersonalDetailsPost(

      {this.candidateId,
        this.candidateAddress,
      this.candidateCityId,
      this.candidatePin,
      this.candidateDob,
      this.candidateMaritalstatusId,
      this.candidatecasteId,
      this.candidateExservicemen,
      this.candidateExservicemenExp,
      this.candidateDifferentlyAbled,
      this.candidateDisabilitType,
      this.candidateDisabilityAssistance,
      this.candidatePancard,
      this.candidatePassportno,
      this.candidateNationalityId,
      this.candidateWorkpermitcountryId});
  Map<String, dynamic> toJson() {
    return {
      "candidateId":candidateId,
      "candidateAddress": candidateAddress,
      "candidateCityId": candidateCityId,
      "candidatePin": candidatePin,
      "candidateDob": candidateDob,
      "candidateMaritalstatusId": candidateMaritalstatusId,
      "candidatecasteId": candidatecasteId,
      "candidateExservicemen": candidateExservicemen,
      "candidateExservicemenExp": candidateExservicemenExp,
      "candidateDifferentlyAbled": candidateDifferentlyAbled,
      "candidateDisabilitType": candidateDisabilitType,
      "candidateDisabilityAssistance": candidateDisabilityAssistance,
      "candidatePancard": candidatePancard,
      "candidatePassportno": candidatePassportno,
      "candidateNationalityId": candidateNationalityId,
      "candidateWorkpermitcountryId": candidateWorkpermitcountryId
    };
  }
}
