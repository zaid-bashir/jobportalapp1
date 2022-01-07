class BasicDetialModel {
  int candidateTitleId;
  String candidateMobile1;
  String candidateFirstName;
  String candidateMiddleName;
  String candidateLastName;
  String candidateEmail1;
  int candidateGenderId;
  String candidateName;
  int candidateTotalworkexp;
  int candidateJobroleId;
  int candidateCityId;

  BasicDetialModel({
    this.candidateTitleId,
    this.candidateMobile1,
    this.candidateFirstName,
    this.candidateMiddleName,
    this.candidateLastName,
    this.candidateEmail1,
    this.candidateGenderId,
    this.candidateName,
    this.candidateTotalworkexp,
    this.candidateJobroleId,
    this.candidateCityId,
  });

  factory BasicDetialModel.fromJson(Map<String, dynamic> json) {
    return BasicDetialModel(
      candidateTitleId: json["candidateTitleId"],
      candidateMobile1 : json["candidateMobile1"],
      candidateFirstName: json["candidateFirstName"],
      candidateMiddleName: json["candidateMiddleName"],
      candidateLastName: json["candidateLastName"],
      candidateEmail1 : json["candiadateEmail1"],
      candidateGenderId: json["candidateGenderId"],
      candidateName: json["candidateName"],
      candidateTotalworkexp: json["candidateTotalworkexp"],
      candidateJobroleId: json["candidateJobroleId"],
      candidateCityId: json["candidateCityId"],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['candidateTitleId'] = candidateTitleId;
    data["candidateMobile1"] = candidateMobile1;
    data['candidateFirstName'] = candidateFirstName;
    data['candidateMiddleName'] = candidateMiddleName;
    data['candidateLastName'] = candidateLastName;
    data["candiadateEmail1"] = candidateEmail1;
    data['candidateGenderId'] = candidateGenderId;
    data['candidateName'] = candidateName;
    data["candidateTotalworkexp"] = candidateTotalworkexp;
    data['candidateJobroleId'] = candidateJobroleId;
    data['candidateCityId'] = candidateCityId;

    return data;
  }
}
