class QualificationPost {
  String requestType;
  String candidatequalUuid;
  int candidatequalQualificationId;
  int candidatequalCourseId;
  int candidatequalStreamId;
  int candidatequalCousetypeId;
  int candidatequalInstituteId;
  String candidatequalInstituteName;
  int candidatequalCompletionYear;
  int candidatequalGradingsystemId;
  int candidatequalMarks;

  QualificationPost(

      {this.requestType,
        this.candidatequalUuid,
        this.candidatequalInstituteName,
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
      "candidatequalUuid": candidatequalUuid,
      "requestType": requestType,
      "candidatequalInstituteName": candidatequalInstituteName,
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
