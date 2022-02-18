class SummaryPopulate {
  String candidateHeadline;
  String candidateProfilesummary;

  SummaryPopulate({this.candidateHeadline, this.candidateProfilesummary});

  factory SummaryPopulate.fromJson(Map<String, dynamic> item) {
    return SummaryPopulate(
      candidateHeadline: item["candidateHeadline"],
      candidateProfilesummary: item["candidateProfilesummary"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "candidateHeadline": candidateHeadline,
      "candidateProfilesummary": candidateProfilesummary,
    };
  }
}
