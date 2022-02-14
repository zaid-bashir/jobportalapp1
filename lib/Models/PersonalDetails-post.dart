class PersonalDetailsPost {
  String requestType;
  String candidateUuid;
  String candidateAddress;
  int candidateCityId;
  String candidatePin;
  DateTime candidateDob;
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
        this.requestType,
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
      "requestType" : requestType,
      "candidateUuid":candidateUuid,
      "candidateAddress": candidateAddress,
      "candidateCityId": candidateCityId,
      "candidatePin": candidatePin,
      "candidateDob":
      "${candidateDob.year.toString().padLeft(4, '0')}-${candidateDob.month.toString().padLeft(2, '0')}-${candidateDob.day.toString().padLeft(2, '0')}",
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
