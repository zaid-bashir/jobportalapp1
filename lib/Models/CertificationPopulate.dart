class CertificationPopulate {
  String requestType;
  String candidatecertificationUuid;
  String candidatecertificationName;
  String candidatecertificationCertificationid;
  String candidatecertificationIssuedby;
  String candidatecertificationWeblink;
  String candidatecertificationIssuedate;
  String candidatecertificationExpiry;
  String candidatecertificationExpirydate;



  CertificationPopulate(
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

  factory CertificationPopulate.fromJson(Map<String, dynamic> item) {
    return CertificationPopulate(
      requestType: item["requestType"],
      candidatecertificationUuid: item["candidatecertificationUuid"],
      candidatecertificationName: item["candidatecertificationName"],
      candidatecertificationCertificationid: item["candidatecertificationCertificationid"],
      candidatecertificationWeblink: item["candidatecertificationWeblink"],
      candidatecertificationIssuedby: item["candidatecertificationIssuedby"],
      candidatecertificationIssuedate: item["candidatecertificationIssuedate"],
      candidatecertificationExpirydate: item["candidatecertificationExpirydate"],
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
      "candidatecertificationIssuedate": candidatecertificationIssuedate,
      "candidatecertificationExpirydate": candidatecertificationExpirydate,
      "candidatecertificationExpiry": candidatecertificationExpiry,

    };
  }
}

