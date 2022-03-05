class QualificationPost {
  String requestType;
  String candidatequalUuid;
  String candidatequalQualificationId;
  String candidatequalCourseId;
  String candidatequalStreamId;
  int candidatequalCousetypeId;
  String candidateHeadline;
  String candidatequalBoardId;
  String candidatequalSchoolmediumId;
  String candidatequalInstituteName;
  String candidatequalCompletionYear;
  String candidatequalGradingsystemId;
  String candidatequalMarks;

  QualificationPost(
      {this.requestType,
      this.candidatequalBoardId,
      this.candidateHeadline,
      this.candidatequalSchoolmediumId,
      this.candidatequalUuid,
      this.candidatequalInstituteName,
      this.candidatequalQualificationId,
      this.candidatequalCourseId,
      this.candidatequalStreamId,
      this.candidatequalCousetypeId,
      // this.candidatequalInstituteId,
      this.candidatequalCompletionYear,
      this.candidatequalGradingsystemId,
      this.candidatequalMarks});

  Map<String, dynamic> toJson() {
    return {
      "candidatequalUuid": candidatequalUuid,
      "requestType": requestType,
      "candidatequalSchoolmediumId": candidatequalSchoolmediumId,
      "candidateHeadline": candidateHeadline,
      "candidatequalInstituteName": candidatequalInstituteName,
      "candidatequalQualificationId": candidatequalQualificationId,
      "candidatequalCourseId": candidatequalCourseId,
      "candidatequalStreamId": candidatequalStreamId,
      "candidatequalCousetypeId": candidatequalCousetypeId,
      "candidatequalBoardId": candidatequalBoardId,
      // "candidatequalInstituteId": candidatequalInstituteId,
      "candidatequalCompletionYear": candidatequalCompletionYear,
      "candidatequalGradingsystemId": candidatequalGradingsystemId,
      "candidatequalMarks": candidatequalMarks,
    };
  }
}
