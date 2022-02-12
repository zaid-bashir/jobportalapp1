class PersonalRetrive {
  String candidateAddress;
  String cityName;
  String candidatePin;
  String maritalstatusName;
  String candidateExservicemen;
  String candidateExservicemenExp;
  String candidatePancard;
  String candidatePassportno;
  String candidateDob;
  String countryName;


  PersonalRetrive({this.candidateAddress,this.cityName,this.candidatePin,this.maritalstatusName,this.candidateExservicemen,this.candidateExservicemenExp,
  this.candidatePancard,this.candidatePassportno,this.candidateDob,this.countryName});

  factory PersonalRetrive.fromJson(Map<String,dynamic> item){
    return PersonalRetrive(
      candidateAddress: item["candidateAddress"],
      cityName: item["cityName"],
      candidatePin: item["candidatePin"],
      maritalstatusName: item["maritalstatusName"],
      candidateExservicemen: item["candidateExservicemen"],
      candidateExservicemenExp: item["candidateExservicemenExp"],
      candidatePancard: item["candidatePancard"],
      candidatePassportno: item["candidatePassportno"],
      candidateDob: item["candidateDob"],
      countryName: item["countryName"],
    );
  }
}

