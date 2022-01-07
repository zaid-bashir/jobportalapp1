class QualificationPost {
  int candidatequalCandidateId;
  int candidatequalQualificationId;
  int candidatequalCourseId;
  int candidatequalStreamId;
  int candidatequalCoursetypeId;
  int candidatequalInstituteId;
  int candidatequalCompletionYear;
  int candidatequalGradingsystemId;
  int candidatequalMarks;

  QualificationPost(
      {this.candidatequalCandidateId,
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
      "candidatequalCandidateId": candidatequalCandidateId,
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
