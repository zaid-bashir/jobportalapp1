class PresentationPopulate {
  String candidatepresentationUuid;
  String candidatepresentationTitle;
  String candidatepresentationWeblink;
  String candidatepresentationDesc;

  PresentationPopulate(
      {this.candidatepresentationUuid,
      this.candidatepresentationTitle,
      this.candidatepresentationWeblink,
      this.candidatepresentationDesc});

  factory PresentationPopulate.fromJson(Map<String, dynamic> item) {
    return PresentationPopulate(
      candidatepresentationUuid: item["candidatepresentationUuid"],
      candidatepresentationTitle: item["candidatepresentationTitle"],
      candidatepresentationWeblink: item["candidatepresentationWeblink"],
      candidatepresentationDesc: item["candidatepresentationDesc"],
    );
  }
}
