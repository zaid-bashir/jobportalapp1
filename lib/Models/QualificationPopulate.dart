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

  QualificationPopulate(
      {this.candidatequalQualificationId,
        this.QualificationName,
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
