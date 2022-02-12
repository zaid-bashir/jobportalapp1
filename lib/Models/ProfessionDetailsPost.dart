class PostProfession {
  String requestType;
  String candidateUuid;
  String candidateexpOrganizationname;
  int candidateexpOrganizationId;
  String candidateexpDesignation;
  String candidateexpSalary;
  String candidateexpStartdate;
  DateTime candidateexpEnddate;
  String candidateexpNoticeperiodId;


  PostProfession({
    this.candidateUuid,
    this.candidateexpNoticeperiodId,
    this.requestType,
    this.candidateexpOrganizationname,
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
      candidateexpOrganizationname: item["candidateexpOrganizationname"],
      candidateexpOrganizationId: item["candidateexpOrganizationId"],
      candidateexpDesignation: item["candidateexpDesignation"],
      candidateexpSalary: item["candidateexpSalary"],
      candidateexpStartdate: item["candidateexpStartdate"],
      candidateexpEnddate: item["candidateexpEnddate"],
      candidateexpNoticeperiodId: item["candidateexpNoticeperiodId"],
      // candidateexpUuid: item["candidateexpUuid"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "candidateUuid": candidateUuid,
      "requestType": requestType,
      "candidateexpOrganizationname": candidateexpOrganizationname,
      "candidateexpOrganizationId": candidateexpOrganizationId,
      "candidateexpDesignation": candidateexpDesignation,
      "candidateexpSalary": candidateexpSalary,
      "candidateexpStartdate": candidateexpStartdate,
      "candidateexpEnddate":
      "${candidateexpEnddate.year.toString().padLeft(4, '0')}-${candidateexpEnddate.month.toString().padLeft(2, '0')}-${candidateexpEnddate.day.toString().padLeft(2, '0')}",
      "candidateexpNoticeperiodId" :candidateexpNoticeperiodId
    };
  }
}

