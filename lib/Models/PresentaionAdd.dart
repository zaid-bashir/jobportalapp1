class PresentationAddModel {
  String requestType;
  String candidatepresentationUuid;

  String candidatepresentationTitle;
  String candidatepresentationWeblink;
  String candidatepresentationDesc;


  PresentationAddModel(
      {this.requestType, this.candidatepresentationTitle, this.candidatepresentationWeblink,
        this.candidatepresentationUuid,
        this.candidatepresentationDesc});

  Map<String, dynamic> toJson() {
    return {
      "requestType": requestType,
      "candidatepresentationUuid": candidatepresentationUuid,
      "candidatepresentationTitle": candidatepresentationTitle,
      "candidatepresentationWeblink": candidatepresentationWeblink,
      "candidatepresentationDesc": candidatepresentationDesc
    };
  }
}
