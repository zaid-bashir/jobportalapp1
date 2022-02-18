class ProjectPopulate {
  String candidateprojectUuid;
  String candidateprojectType;
  String candidateprojectTitle;
  String candidateprojectClient;
  String candidateprojectStatus;
  String candidateprojectStartdate;
  String candidateprojectEnddate;
  String candidateprojectWeblink;
  String candidateprojectDesc;
  String candidateprojectLocationId;
  String projectLocation;
  String candidateprojectSite;
  String candidateprojectTeamsize;
  String candidateprojectEmploymenttypeId;
  String candidateprojectRoledescription;
  String candidateprojectSkillsused;
  String requestType;

  ProjectPopulate(
      {this.candidateprojectUuid,
        this.requestType,
        this.candidateprojectType,
        this.candidateprojectTitle,
        this.candidateprojectClient,
        this.candidateprojectStatus,
        this.candidateprojectStartdate,
        this.candidateprojectEnddate,
        this.candidateprojectWeblink,
        this.candidateprojectDesc,
        this.projectLocation,
        this.candidateprojectLocationId,
        this.candidateprojectSite,
        this.candidateprojectEmploymenttypeId,
        this.candidateprojectTeamsize,
        this.candidateprojectSkillsused,
        this.candidateprojectRoledescription});

  factory ProjectPopulate.fromJson(Map<String, dynamic> item) {
    return ProjectPopulate(
      candidateprojectUuid: item["candidateprojectUuid"],
      candidateprojectType: item["candidateprojectType"],
      requestType: item["requestType"],
      candidateprojectTitle: item["candidateprojectTitle"],
      candidateprojectClient: item["candidateprojectClient"],
      candidateprojectStatus: item["candidateprojectStatus"],
      candidateprojectStartdate: item["candidateprojectStartdate"],
      candidateprojectEnddate: item["candidateprojectEnddate"],
      candidateprojectWeblink: item["candidateprojectWeblink"],
      candidateprojectDesc: item["candidateprojectDesc"],
      candidateprojectLocationId: item["candidateprojectLocationId"],
      projectLocation: item["projectLocation"],
      candidateprojectSite: item["candidateprojectSite"],
      candidateprojectEmploymenttypeId:
      item["candidateprojectEmploymenttypeId"],
      candidateprojectTeamsize: item["candidateprojectTeamsize"],
      candidateprojectSkillsused: item["candidateprojectSkillsused"],
      candidateprojectRoledescription: item["candidateprojectRoledescription"],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      "candidateprojectUuid": candidateprojectUuid,
      "requestType": requestType,
      "candidateprojectType": candidateprojectType,
      "candidateprojectTitle": candidateprojectTitle,
      "candidateprojectClient": candidateprojectClient,
      "candidateprojectStatus": candidateprojectStatus,
      "candidateprojectStartdate": candidateprojectStartdate,
      "candidateprojectEnddate": candidateprojectEnddate,
      "candidateprojectWeblink": candidateprojectWeblink,
      "candidateprojectDesc": candidateprojectDesc,
      "candidateprojectLocationId": candidateprojectLocationId,
      "projectLocation": projectLocation,
      "candidateprojectSite": candidateprojectSite,
      "candidateprojectEmploymenttypeId": candidateprojectEmploymenttypeId,
      "candidateprojectTeamsize": candidateprojectTeamsize,
      "candidateprojectSkillsused": candidateprojectSkillsused,
      "candidateprojectRoledescription": candidateprojectRoledescription,
    };
  }
}
