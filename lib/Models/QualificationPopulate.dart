class QualificationPopulate {
  int candidatequalQualificationId;
  String QualificationName;
  int CandidatequalStartYear;
  String CourseName;
  String StreamName;
  String InstituteName;
  String CoursetypeName;

  QualificationPopulate({this.candidatequalQualificationId,this.QualificationName,this.CandidatequalStartYear,this.CourseName,this.StreamName
  ,this.InstituteName,this.CoursetypeName});

  factory QualificationPopulate.fromJson(Map<String,dynamic> item){
    return QualificationPopulate(
      candidatequalQualificationId: item["candidatequalQualificationId"],
      QualificationName: item["QualificationName"],
      CandidatequalStartYear: item["CandidatequalStartYear"],
      CourseName: item["CourseName"],
      StreamName: item["StreamName"],
      InstituteName: item["InstituteName"],
      CoursetypeName: item["CoursetypeName"],
    );
  }
}
