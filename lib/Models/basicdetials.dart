class BasicDetialModel {
  int candidateTitleId;
  String candidateFirstName;
  String candidateMiddleName;
  String candidateLastName;
  String candidateEmail1;
  int candidateGenderId;
  // String candiadteexpExperience;
  String candidateTotalworkexp;
  int candidateJobroleId;
  int candidateCityId;

  BasicDetialModel({
    this.candidateTitleId,
    this.candidateFirstName,
    this.candidateMiddleName,
    this.candidateLastName,
    this.candidateEmail1,
    this.candidateGenderId,
    // this.candiadteexpExperience,
    this.candidateTotalworkexp,
    this.candidateJobroleId,
    this.candidateCityId,
  });

  factory BasicDetialModel.fromJson(Map<String, dynamic> json) {
    return BasicDetialModel(
      candidateTitleId: json["candidateTitleId"],
      candidateFirstName: json["candidateFirstName"],
      candidateMiddleName: json["candidateMiddleName"],
      candidateLastName: json["candidateLastName"],
      candidateEmail1 : json["candiadateEmail1"],
      candidateGenderId: json["candidateGenderId"],
      // candiadteexpExperience: json["candiadteexpExperience"],
      candidateTotalworkexp: json["candidateTotalworkexp"],
      candidateJobroleId: json["candidateJobroleId"],
      candidateCityId: json["candidateCityId"],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['candidateTitleId'] = candidateTitleId;
    data['candidateFirstName'] = candidateFirstName;
    data['candidateMiddleName'] = candidateMiddleName;
    data['candidateLastName'] = candidateLastName;
    data["candiadateEmail1"] = candidateEmail1;
    data['candidateGenderId'] = candidateGenderId;
    // data['candiadteexpExperience'] = candiadteexpExperience;
    data["candidateTotalworkexp"] = candidateTotalworkexp;
    data['candidateJobroleId'] = candidateJobroleId;
    data['candidateCityId'] = candidateCityId;

    return data;
  }
}
