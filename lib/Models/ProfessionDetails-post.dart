import 'package:job_portal/Models/RegisterNoticePeriod.dart';

class PostProfession {
  String candidateUuid;
  String candidateexpOrganizationname;
  String candidateexpIscurrentcompany;
  int candidateexpOrganizationId;
  String candidateexpDesignation;
  String candidateexpSalary;
  String candidateexpStartdate;
  DateTime candidateexpEnddate;
  String candidateexpNoticeperiodId;

  // String candidateexpUuid;

  PostProfession(
      {this.candidateUuid,
      this.candidateexpOrganizationname,
      this.candidateexpIscurrentcompany,
        this.candidateexpOrganizationId,
      this.candidateexpDesignation,
      this.candidateexpSalary,
      this.candidateexpStartdate,
      this.candidateexpEnddate,
      this.candidateexpNoticeperiodId,
      // this.candidateexpUuid
      });

  factory PostProfession.fromJson(Map<String, dynamic> item) {
    return PostProfession(
        candidateUuid: item["candidateUuid"],
        candidateexpOrganizationname: item["candidateexpOrganizationname"],
      candidateexpIscurrentcompany: item["candidateexpIscurrentcompany"],
        candidateexpOrganizationId: item["candidateexpOrganizationId"],
        candidateexpDesignation: item["candidateexpDesignation"],
        candidateexpSalary: item["candidateexpSalary"],
        candidateexpStartdate: item["candidateexpStartdate"],
        candidateexpEnddate: item["candidateexpEnddate"],
        candidateexpNoticeperiodId: item["candidateexpNoticeperiodId"]
        // candidateexpUuid: item["candidateexpUuid"],
       );
  }

  Map<String, dynamic> toJson() {
    return {
      "candidateUuid": candidateUuid,
      "candidateexpOrganizationname": candidateexpOrganizationname,
      "candidateexpIscurrentcompany": candidateexpIscurrentcompany,
      "candidateexpOrganizationId": candidateexpOrganizationId,
      "candidateexpDesignation": candidateexpDesignation,
      "candidateexpSalary": candidateexpSalary,
      "candidateexpStartdate": candidateexpStartdate,

      "candidateexpEnddate":
      "${candidateexpEnddate.year.toString().padLeft(4, '0')}-${candidateexpEnddate.month.toString().padLeft(2, '0')}-${candidateexpEnddate.day.toString().padLeft(2, '0')}",
      "candidateexpNoticeperiodId" : candidateexpNoticeperiodId,
    };
  }
}
