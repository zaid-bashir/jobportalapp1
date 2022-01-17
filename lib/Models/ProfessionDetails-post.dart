class PostProfession {
  String candidateUuid;
  String candidateexpOrganizationName;
  String candidateexpIscurrentcompany;
  int candidateexpOrganizationId;
  String candidateexpDesignation;
  int candidateexpSalary;
  DateTime candidateexpStartdate;
  DateTime candidateexpEnddate;

  // String candidateexpUuid;

  PostProfession(
      {this.candidateUuid,
      this.candidateexpOrganizationName,
      this.candidateexpIscurrentcompany,
        this.candidateexpOrganizationId,
      this.candidateexpDesignation,
      this.candidateexpSalary,
      this.candidateexpStartdate,
      this.candidateexpEnddate,

      // this.candidateexpUuid
      });

  factory PostProfession.fromJson(Map<String, dynamic> item) {
    return PostProfession(
        candidateUuid: item["candidateUuid"],
        candidateexpOrganizationName: item["candidateexpOrganizationName"],
      candidateexpIscurrentcompany: item["candidateexpIscurrentcompany"],
        candidateexpOrganizationId: item["candidateexpOrganizationId"],
        candidateexpDesignation: item["candidateexpDesignation"],
        candidateexpSalary: item["candidateexpSalary"],
        candidateexpStartdate: item["candidateexpStartdate"],
        candidateexpEnddate: item["candidateexpEnddate"],
        // candidateexpUuid: item["candidateexpUuid"],
       );
  }

  Map<String, dynamic> toJson() {
    return {
      "candidateUuid": candidateUuid,
      "candidateexpOrganizationName": candidateexpOrganizationName,
      "candidateexpIscurrentcompany": candidateexpIscurrentcompany,
      "candidateexpOrganizationId": candidateexpOrganizationId,
      "candidateexpDesignation": candidateexpDesignation,
      "candidateexpSalary": candidateexpSalary,
      "candidateexpStartdate":"${candidateexpStartdate.year.toString().padLeft(4, '0')}-${candidateexpStartdate.month.toString().padLeft(2, '0')}-${candidateexpStartdate.day.toString().padLeft(2, '0')}",

      "candidateexpEnddate":
      "${candidateexpEnddate.year.toString().padLeft(4, '0')}-${candidateexpEnddate.month.toString().padLeft(2, '0')}-${candidateexpEnddate.day.toString().padLeft(2, '0')}",

    };
  }
}
