class CertificationAdd {
  String requestType;
  String candidatecertificationUuid;
  String candidatecertificationName;
  String candidatecertificationCertificationid;
  String candidatecertificationIssuedby;
  String candidatecertificationWeblink;
  DateTime candidatecertificationIssuedate;
  String candidatecertificationExpiry;
  DateTime candidatecertificationExpirydate;



  CertificationAdd(
      {
        this.requestType,
        this.candidatecertificationUuid,
        this.candidatecertificationName,
        this.candidatecertificationCertificationid,
        this.candidatecertificationWeblink,
        this.candidatecertificationIssuedby,
        this.candidatecertificationIssuedate,
        this.candidatecertificationExpiry,
        this.candidatecertificationExpirydate
      });

  factory CertificationAdd.fromJson(Map<String, dynamic> item) {
    return CertificationAdd(
      requestType: item["requestType"],
      candidatecertificationUuid: item["candidatecertificationUuid"],
      candidatecertificationName: item["candidatecertificationName"],
      candidatecertificationCertificationid: item["candidatecertificationCertificationid"],
      candidatecertificationWeblink: item["candidatecertificationWeblink"],
      candidatecertificationIssuedby: item["candidatecertificationIssuedby"],
      candidatecertificationIssuedate: DateTime.parse(item["candidatecertificationIssuedate"]) ,
      candidatecertificationExpirydate:  DateTime.parse(item["candidatecertificationExpirydate"]),
      candidatecertificationExpiry: item["candidatecertificationExpiry"],

    );
  }

  Map<String, dynamic> toJson() {
    return {
      "candidatecertificationUuid": candidatecertificationUuid,
      "requestType": requestType,
      "candidatecertificationName": candidatecertificationName,
      "candidatecertificationCertificationid": candidatecertificationCertificationid,
      "candidatecertificationWeblink": candidatecertificationWeblink,
      "candidatecertificationIssuedby": candidatecertificationIssuedby,
      "candidatecertificationIssuedate": "${candidatecertificationIssuedate.year.toString().padLeft(4, '0')}-${candidatecertificationIssuedate.month.toString().padLeft(2, '0')}-${candidatecertificationIssuedate.day.toString().padLeft(2, '0')}",
      "candidatecertificationExpirydate": "${candidatecertificationExpirydate.year.toString().padLeft(4, '0')}-${candidatecertificationExpirydate.month.toString().padLeft(2, '0')}-${candidatecertificationExpirydate.day.toString().padLeft(2, '0')}",
      "candidatecertificationExpiry": candidatecertificationExpiry,

    };
  }
}
