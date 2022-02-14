class QualificationPopulate {
  int candidatequalQualificationId;
  String QualificationName;
  String CandidatequalStartYear;
  String CandidatequalCompletionYear;
  String CandidatequalMarks;
  String CourseName;
  String StreamName;
  String getBoardName;
  String SchoolmediumName;
  String InstituteName;
  String CoursetypeName;
  String candidatequalUuid;
  int candidatequalCousetypeId;

  QualificationPopulate(

      {this.candidatequalUuid,this.candidatequalQualificationId,
      this.QualificationName,
        this.candidatequalCousetypeId,
      this.CandidatequalStartYear,
      this.CourseName,
      this.StreamName,
      this.InstituteName,
      this.CoursetypeName,
      this.CandidatequalCompletionYear,
      this.CandidatequalMarks,
      this.getBoardName,
      this.SchoolmediumName});

  factory QualificationPopulate.fromJson(Map<String, dynamic> item) {
    return QualificationPopulate(
        candidatequalQualificationId: item["candidatequalQualificationId"],
        candidatequalUuid: item["candidatequalUuid"],
        candidatequalCousetypeId: item["candidatequalCousetypeId"],
        QualificationName: item["QualificationName"],
        CandidatequalStartYear: item["CandidatequalStartYear"],
        CourseName: item["CourseName"],
        StreamName: item["StreamName"],
        InstituteName: item["InstituteName"],
        CoursetypeName: item["CoursetypeName"],
        CandidatequalCompletionYear: item["CandidatequalCompletionYear"],
        CandidatequalMarks: item["CandidatequalMarks"],
        getBoardName: item["getBoardName"],
        SchoolmediumName: item["SchoolmediumName"]);
  }
}
