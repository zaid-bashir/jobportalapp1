class Awards {
  String requestType;
  String candidateawardUuid;
  String candidateawardTitle;
  String candidateawardDesc;
  String candidateawardWeblink;
  String candidateawardDate;

  Awards(
      {this.candidateawardUuid,
      this.candidateawardTitle,
      this.requestType,
      this.candidateawardDesc,
      this.candidateawardWeblink,
      this.candidateawardDate});

  factory Awards.fromJson(Map<String, dynamic> item) {
    return Awards(
      candidateawardUuid: item["candidateawardUuid"],
      candidateawardTitle: item["candidateawardTitle"],
      candidateawardDesc: item["candidateawardDesc"],
      requestType: item["requestType"],
      candidateawardWeblink: item["candidateawardWeblink"],
      candidateawardDate: item["candidateawardDate"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "requestType": requestType,
      "candidateawardUuid": candidateawardUuid,
      "candidateawardTitle": candidateawardTitle,
      "candidateawardDesc": candidateawardDesc,
      "candidateawardWeblink": candidateawardWeblink,
      "candidatepatentIssuedate": candidateawardDate,
      // "${candidateawardDate.year.toString().padLeft(4, '0')}-${candidateawardDate.month.toString().padLeft(2, '0')}-${candidateawardDate.day.toString().padLeft(2, '0')}",

    };
  }
}
