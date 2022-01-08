class BasicDetailResponse {
  String axelaCandidateUuId;
  int axelaCandidateId;
  String axelaCandidateEmail1;
  String axelaCandidateName;
  String axelaCandidateMobile;

  BasicDetailResponse(
      {this.axelaCandidateUuId,
        this.axelaCandidateId,
        this.axelaCandidateEmail1,
        this.axelaCandidateName,
        this.axelaCandidateMobile});

  BasicDetailResponse.fromJson(Map<String, dynamic> json) {
    axelaCandidateUuId = json['axelaCandidateUuId'];
    axelaCandidateId = json['axelaCandidateId'];
    axelaCandidateEmail1 = json['axelaCandidateEmail1'];
    axelaCandidateName = json['axelaCandidateName'];
    axelaCandidateMobile = json["axelaCandidateMobile"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['axelaCandidateUuId'] = axelaCandidateUuId;
    data['axelaCandidateId'] = axelaCandidateId;
    data['axelaCandidateEmail1'] = axelaCandidateEmail1;
    data['axelaCandidateName'] = axelaCandidateName;
    data["axelaCandidateMobile"] = axelaCandidateMobile;
    return data;
  }
}
