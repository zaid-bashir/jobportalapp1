class PatentPopulate {
  String candidatepatentUuid;
  String candidatepatentApplicationnumber;
  String candidatepatentDesc;
  String candidatepatentTitle;
  String candidatepatentOffice;
  String candidatepatentIssuedate;
  String candidatepatentStatus;
  String candidatepatentWeblink;

  PatentPopulate(
      {this.candidatepatentUuid,
      this.candidatepatentApplicationnumber,
      this.candidatepatentDesc,
      this.candidatepatentTitle,
      this.candidatepatentOffice,
      this.candidatepatentIssuedate,
      this.candidatepatentStatus,
      this.candidatepatentWeblink});

  factory PatentPopulate.fromJson(Map<String, dynamic> item) {
    return PatentPopulate(
      candidatepatentUuid: item["candidatepatentUuid"],
      candidatepatentApplicationnumber:
          item["candidatepatentApplicationnumber"],
      candidatepatentDesc: item["candidatepatentDesc"],
      candidatepatentTitle: item["candidatepatentTitle"],
      candidatepatentOffice: item["candidatepatentOffice"],
      candidatepatentIssuedate: item["candidatepatentIssuedate"],
      candidatepatentStatus: item["candidatepatentStatus"],
      candidatepatentWeblink: item["candidatepatentWeblink"],
    );
  }
}
