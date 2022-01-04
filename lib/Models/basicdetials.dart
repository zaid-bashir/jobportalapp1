class BasicDetialModel {
  int candidateTitleId;
  String candidateFirstName;
  String candidateMiddleName;
  String candidateLastName;
  String candidateGenderId;
  String candiadteexpExperience;
  String candiadteexpStartyear;
  String candiadteexpEndmonth;
  int candidateJobroleId;
  int candidateCityId;

  BasicDetialModel({
    this.candidateTitleId,
    this.candidateFirstName,
    this.candidateMiddleName,
    this.candidateLastName,
    this.candidateGenderId,
    this.candiadteexpExperience,
    this.candiadteexpStartyear,
    this.candiadteexpEndmonth,
    this.candidateJobroleId,
    this.candidateCityId,
  });

   factory  BasicDetialModel.fromJson(Map<String, dynamic> json) {
   return BasicDetialModel(
     candidateTitleId: json["candidateTitleId"],
     candidateFirstName: json["candidateFirstName"],
     candidateMiddleName: json["candidateMiddleName"],
     candidateLastName: json["candidateLastName"],
     candidateGenderId: json["candidateGenderId"],
     candiadteexpExperience: json["candiadteexpExperience"],
     candiadteexpStartyear: json["candiadteexpStartyear"],
     candiadteexpEndmonth: json["candiadteexpEndmonth"],
     candidateJobroleId: json["candidateJobroleId"],
     candidateCityId: json["candidateCityId"],
   );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['candidateTitleId'] = candidateTitleId;
    data['candidateFirstName'] = candidateFirstName;
    data['candidateMiddleName'] = candidateMiddleName;
    data['candidateLastName'] = candidateLastName;
    data['candidateGenderId'] = candidateGenderId;
    data['candiadteexpExperience'] = candiadteexpExperience;
    data['candiadteexpStartyear'] = candiadteexpStartyear;
    data['candiadteexpEndmonth'] = candiadteexpEndmonth;
    data['candidateJobroleId'] = candidateJobroleId;
    data['candidateCityId'] = candidateCityId;
    
    return data;
  }

}
