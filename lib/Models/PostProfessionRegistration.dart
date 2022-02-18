// ignore_for_file: file_names

class PostProfessionRegistration {
  int candidateexpIscurrentcompany;
  String candidateexpOrganizationname;
  String candidateexpNoticeperiodId;
  String candidateexpDesignation;
  String candidateexpSalary;
  String candidateexpStartdate;
  String candidateexpEnddate;


  PostProfessionRegistration(
      {this.candidateexpIscurrentcompany,
      this.candidateexpOrganizationname,
      this.candidateexpNoticeperiodId,
      this.candidateexpDesignation,
      this.candidateexpSalary,
      this.candidateexpStartdate,
      this.candidateexpEnddate});

  PostProfessionRegistration.fromJson(Map<String, dynamic> json) {
    candidateexpIscurrentcompany = json['candidateexpIscurrentcompany'];
    candidateexpOrganizationname = json['candidateexpOrganizationname'];
    candidateexpNoticeperiodId = json['candidateexpNoticeperiodId'];
    candidateexpDesignation = json['candidateexpDesignation'];
    candidateexpSalary = json['candidateexpSalary'];
    candidateexpStartdate = json['candidateexpStartdate'];
    candidateexpEnddate = json['candidateexpEnddate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['candidateexpIscurrentcompany'] = candidateexpIscurrentcompany;
    data['candidateexpOrganizationname'] = candidateexpOrganizationname;
    data['candidateexpNoticeperiodId'] = candidateexpNoticeperiodId;
    data['candidateexpDesignation'] = candidateexpDesignation;
    data['candidateexpSalary'] = candidateexpSalary;
    data['candidateexpStartdate'] = candidateexpStartdate;
    data['candidateexpEnddate'] = candidateexpEnddate;
    return data;
  }
}
