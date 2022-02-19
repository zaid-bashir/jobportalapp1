class CareerProfileUpdate{
  List candidateIndustryIdsList;
  List candidateJobtypeIdsList;
  List candidateEmploymenttypeIdsList;
  List candidatePreferredCityIdsList;
  String candidateIndustryId;
  String candidateExpectedctc;
  String candidateShiftId;
  DateTime candidateJoindate;
  CareerProfileUpdate(
      {
this.candidateIndustryIdsList,
         this.candidateJobtypeIdsList,
         this.candidateEmploymenttypeIdsList,
         this.candidatePreferredCityIdsList,
         this.candidateIndustryId,
         this.candidateExpectedctc,
         this.candidateShiftId,
        this.candidateJoindate

      });

  Map<String, dynamic> toJson() {
    return {
      "candidateIndustryIdsList":candidateIndustryIdsList,
      "candidateJobtypeIdsList":candidateJobtypeIdsList,
      "candidateEmploymenttypeIdsList":candidateEmploymenttypeIdsList,
      "candidatePreferredCityIdsList":candidatePreferredCityIdsList,
      "candidateIndustryId":candidateIndustryId,
      "candidateExpectedctc":candidateExpectedctc,
      "candidateShiftId":candidateShiftId,
      "candidateJoindate": "${candidateJoindate.year.toString().padLeft(4, '0')}-${candidateJoindate.month.toString().padLeft(2, '0')}-${candidateJoindate.day.toString().padLeft(2, '0')}",

    };
  }













}
