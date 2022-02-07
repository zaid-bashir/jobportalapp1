class PersonalDetailsPost {
  String candidateUuid;
  String candidateAddress;
  int candidateCityId;
  String candidatePin;
  String candidateDob;
  int candidateMaritalstatusId;
  int candidateReservedcategoryId;
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

      {this.candidateUuid,
        this.candidateAddress,
        this.candidateCityId,
        this.candidatePin,
        this.candidateDob,
        this.candidateMaritalstatusId,
        this.candidateReservedcategoryId,
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
      "candidateUuid":candidateUuid,
      "candidateAddress": candidateAddress,
      "candidateCityId": candidateCityId,
      "candidatePin": candidatePin,
      "candidateDob": candidateDob,
      "candidateMaritalstatusId": candidateMaritalstatusId,
      "candidateReservedcategoryId": candidateReservedcategoryId,
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
