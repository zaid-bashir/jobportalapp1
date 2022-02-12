class CertificationPopulate {
  String candidatecertificationUuid;
  String candidatecertificationName;
  String candidatecertificationIssuedby;
  String candidatecertificationWeblink;
String candidatecertificationIssuedate;
  String candidatecertificationExpiry;
  String candidatecertificationExpirydate;



  CertificationPopulate(
      {this.candidatecertificationUuid,
        this.candidatecertificationName,
        this.candidatecertificationWeblink,
        this.candidatecertificationIssuedby,
        this.candidatecertificationIssuedate,
        this.candidatecertificationExpiry,
        this.candidatecertificationExpirydate
        });

  factory CertificationPopulate.fromJson(Map<String, dynamic> item) {
    return CertificationPopulate(
     candidatecertificationUuid: item["candidateprojectUuid"],
      candidatecertificationName: item["candidatecertificationName"],
      candidatecertificationWeblink: item["candidatecertificationWeblink"],
      candidatecertificationIssuedby: item["candidatecertificationIssuedby"],
      candidatecertificationIssuedate: item["candidatecertificationIssuedate"],
     candidatecertificationExpirydate: item["candidateprojectStartdate"],
     candidatecertificationExpiry: item["candidateprojectEnddate"],
     
    );
  }
}
