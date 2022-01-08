
class CareerPreferencePost {
  int candidateIndustryId;
  String candidateJobtypeIds;
  String candidateEmploymenttypeIds;
  String candidatePreferredCityIds;
  int candidateExpectedctc;
  int candidateShiftId;
  String candidateJoinimmediate;
  DateTime candidateJoinDate;


  CareerPreferencePost(
  {
    this.candidateIndustryId,
    this.candidateJobtypeIds,
    this.candidateEmploymenttypeIds,
    this.candidatePreferredCityIds,
    this.candidateExpectedctc,
    this.candidateShiftId,
    this.candidateJoinimmediate,
    this.candidateJoinDate

});

  Map<String, dynamic> toJson() {
    return {
      "candidateIndustryId": candidateIndustryId,
      "candidateJobtypeIds": candidateJobtypeIds,
      "candidateEmploymenttypeIds": candidateEmploymenttypeIds,
      "candidatePreferredCityIds": candidatePreferredCityIds,
      "candidateExpectedctc": candidateExpectedctc,
      "candidateShiftId": candidateShiftId,
      "candidateJoinimmediate": candidateJoinimmediate,
      "candidateJoinDate": candidateJoinDate,

    };
  }
}
