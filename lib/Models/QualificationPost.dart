class QualificationPost {
  String candidateUuid;
  int candidatequalQualificationId;
  int candidatequalCourseId;
  int candidatequalStreamId;
  int candidatequalCousetypeId;
  int candidatequalInstituteId;
  int candidatequalCompletionYear;
  int candidatequalGradingsystemId;
  int candidatequalMarks;

  QualificationPost(
      {this.candidateUuid,
      this.candidatequalQualificationId,
      this.candidatequalCourseId,
      this.candidatequalStreamId,
      this.candidatequalCousetypeId,
      this.candidatequalInstituteId,
      this.candidatequalCompletionYear,
      this.candidatequalGradingsystemId,
      this.candidatequalMarks});


  Map<String, dynamic> toJson() {
    return {
      "candidateUuid": candidateUuid,
      "candidatequalQualificationId": candidatequalQualificationId,
      "candidatequalCourseId": candidatequalCourseId,
      "candidatequalStreamId": candidatequalStreamId,
      "candidatequalCousetypeId": candidatequalCousetypeId,
      "candidatequalInstituteId": candidatequalInstituteId,
      "candidatequalCompletionYear": candidatequalCompletionYear,
      "candidatequalGradingsystemId": candidatequalGradingsystemId,
      "candidatequalMarks": candidatequalMarks,

    };
  }


}
