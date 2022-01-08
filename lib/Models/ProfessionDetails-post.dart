class PostProfession {
  int candidateexpCompanyId;
  String candidateexpCompanyName;
  String candidateexpDesignation;
  int candidateexpSalary;
  int candidateexpStartyear;
  int candidateexpStartmonth;
  int candidateIndustryId;
  String candidateexpUuid;

  PostProfession(
      {this.candidateexpCompanyId,
      this.candidateexpCompanyName,
      this.candidateexpDesignation,
      this.candidateexpSalary,
      this.candidateexpStartyear,
      this.candidateexpStartmonth,
      this.candidateIndustryId,
      this.candidateexpUuid});

  factory PostProfession.fromJson(Map<String, dynamic> item) {
    return PostProfession(
        candidateexpCompanyId: item["candidateexpCompanyId"],
        candidateexpCompanyName: item["candidateexpCompanyName"],
        candidateexpDesignation: item["candidateexpDesignation"],
        candidateexpSalary: item["candidateexpSalary"],
        candidateexpStartyear: item["candidateexpStartyear"],
        candidateexpStartmonth: item["candidateexpStartmonth"],
        candidateexpUuid: item["candidateexpUuid"],
        candidateIndustryId: item["candidateIndustryId"]);
  }

  Map<String, dynamic> toJson() {
    return {
      "candidateexpCompanyId": candidateexpCompanyId,
      "candidateexpCompanyName": candidateexpCompanyName,
      "candidateexpDesignation": candidateexpDesignation,
      "candidateexpSalary": candidateexpSalary,
      "candidateexpStartyear": candidateexpStartyear,
      "candidateexpStartmonth": candidateexpStartmonth,
      "candidateexpUuid": candidateexpUuid,
      "candidateIndustryId": candidateIndustryId
    };
  }
}
