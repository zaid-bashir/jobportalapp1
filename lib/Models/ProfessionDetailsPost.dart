class PostProfession {
  String requestType;
  String candidateexpUuid;
  int candidateexpIscurrentcompany;
  String candidateexpOrganizationname;
  String candidateexpDesignation;
  String  candidateexpStartdate;
  String candidateexpEnddate;
  String candidateexpSalary;
  String candidateexpNoticeperiodId;



  PostProfession({
    this.requestType,
    this.candidateexpUuid,
    this.candidateexpIscurrentcompany,
    this.candidateexpOrganizationname,
    this.candidateexpDesignation,
    this.candidateexpStartdate,
    this.candidateexpEnddate,
    this.candidateexpSalary,
    this.candidateexpNoticeperiodId

  });

  PostProfession.fromJson(Map<String, dynamic> json) {
    requestType = json['requestType'];
    candidateexpUuid = json['candidateexpUuid'];
    candidateexpIscurrentcompany = json['candidateexpIscurrentcompany'];
    candidateexpOrganizationname = json['candidateexpOrganizationname'];
    candidateexpDesignation = json['candidateexpDesignation'];
    candidateexpStartdate = json['candidateexpStartdate'];
    candidateexpEnddate = json['candidateexpEnddate'];
    candidateexpSalary = json['candidateexpSalary'];
    candidateexpNoticeperiodId = json['candidateexpNoticeperiodId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['requestType'] = requestType;
    data['candidateexpUuid'] = candidateexpUuid;
    data['candidateexpIscurrentcompany'] = candidateexpIscurrentcompany;
    data['candidateexpOrganizationname'] = candidateexpOrganizationname;
    data['candidateexpDesignation'] = candidateexpDesignation;
    data['candidateexpStartdate'] = candidateexpStartdate;
    data['candidateexpEnddate'] = candidateexpEnddate;
    data['candidateexpSalary'] = candidateexpSalary;
    data['candidateexpNoticeperiodId'] = candidateexpNoticeperiodId;
    return data;
  }
}

