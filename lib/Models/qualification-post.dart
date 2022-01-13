class QualificationPost {
  String candidateUuId;
  int candidatequalQualificationId;
  int candidatequalCourseId;
  int candidatequalStreamId;
  int candidatequalCoursetypeId;
  int candidatequalInstituteId;
  int candidatequalCompletionYear;
  int candidatequalGradingsystemId;
  int candidatequalMarks;

  QualificationPost(
      {this.candidateUuId,
      this.candidatequalQualificationId,
      this.candidatequalCourseId,
      this.candidatequalStreamId,
      this.candidatequalCoursetypeId,
      this.candidatequalInstituteId,
      this.candidatequalCompletionYear,
      this.candidatequalGradingsystemId,
      this.candidatequalMarks});


  Map<String, dynamic> toJson() {
    return {
      "candidatequalCandidateId": candidateUuId,
      "candidatequalQualificationId": candidatequalQualificationId,
      "candidatequalCourseId": candidatequalCourseId,
      "candidatequalStreamId": candidatequalStreamId,
      "candidatequalCoursetypeId": candidatequalCoursetypeId,
      "candidatequalInstituteId": candidatequalInstituteId,
      "candidatequalCompletionYear": candidatequalCompletionYear,
      "candidatequalGradingsystemId": candidatequalGradingsystemId,
      "candidatequalMarks": candidatequalMarks,

    };
  }


}
