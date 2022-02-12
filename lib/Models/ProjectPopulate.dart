class ProjectPopulate {
  String candidateprojectUuid;
  String candidateprojectTitle;
  String candidateprojectClient;
  String candidateprojectStatus;
  String candidateprojectStartdate;
  String candidateprojectEnddate;
  String candidateprojectProfile;
  String candidateprojectLocation;
  String candidateprojectSite;
  String candidateprojectTeamsize;

  ProjectPopulate(
      {this.candidateprojectUuid,
      this.candidateprojectTitle,
      this.candidateprojectClient,
      this.candidateprojectStatus,
      this.candidateprojectStartdate,
      this.candidateprojectEnddate,
      this.candidateprojectProfile,
      this.candidateprojectLocation,
      this.candidateprojectSite,
      this.candidateprojectTeamsize});

  factory ProjectPopulate.fromJson(Map<String, dynamic> item) {
    return ProjectPopulate(
      candidateprojectUuid: item["candidateprojectUuid"],
      candidateprojectTitle: item["candidateprojectTitle"],
      candidateprojectClient: item["candidateprojectClient"],
      candidateprojectStatus: item["candidateprojectStatus"],
      candidateprojectStartdate: item["candidateprojectStartdate"],
      candidateprojectEnddate: item["candidateprojectEnddate"],
      candidateprojectProfile: item["candidateprojectProfile"],
      candidateprojectLocation: item["candidateprojectLocation"],
      candidateprojectSite: item["candidateprojectSite"],
      candidateprojectTeamsize: item["candidateprojectTeamsize"],
    );
  }
}
