class CareerPreferencePost {
  String candidateUuid;
  List candidateIndustryIdsList;
  List candidateJobtypeIdsList;
  List candidateEmploymenttypeIdsList;
  List candidatePreferredCityIdsList;
  int candidateExpectedctc;
  int candidateShiftId;
  String candidateJoinimmediate;
  DateTime candidateJoindate;

  CareerPreferencePost(
      {this.candidateUuid,
      this.candidateIndustryIdsList,
      this.candidateJobtypeIdsList,
      this.candidateEmploymenttypeIdsList,
      this.candidatePreferredCityIdsList,
      this.candidateExpectedctc,
      this.candidateShiftId,
      this.candidateJoinimmediate,
      this.candidateJoindate});

  Map<String, dynamic> toJson() {
    return {
      "candidateUuid": candidateUuid,
      "candidateIndustryIdsList": candidateIndustryIdsList,
      "candidateJobtypeIdsList": candidateJobtypeIdsList,
      "candidateEmploymenttypeIdsList": candidateEmploymenttypeIdsList,
      "candidatePreferredCityIdsList": candidatePreferredCityIdsList,
      "candidateExpectedctc": candidateExpectedctc,
      "candidateShiftId": candidateShiftId,
      "candidateJoinimmediate": candidateJoinimmediate,
      "candidateJoindate": candidateJoindate,
    };
  }
}
