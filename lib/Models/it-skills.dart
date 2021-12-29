class ITSkills {

  int skillsId;
  String skillsName;

  String version;
  String itYears;
  String itMonths;
  int yearId;
  String yearName;


// changes
  ITSkills(
      {
        this.skillsId,
        this.skillsName,

        this.version,
        this.itYears,
        this.itMonths,
        this.yearId,
        this.yearName,
       });

  factory ITSkills.fromJson(Map<String, dynamic> item) {
    return ITSkills(
      skillsId: item["skillsId"],
      skillsName: item["skillsName"],
      version: item["  version"],
      itMonths: item["  itMonths"],
      itYears: item["itYears"],
      yearName: item["  yearNam"],
      yearId: item["  yearId"],

    );
  }

  Map<String, dynamic> toJson() {
    return {
      "version": version,
      "skillsId": skillsId,
      "skillsName": skillsName,
      "itYears": itYears,
      "itMonths": itMonths,
      "yearName": yearName,
      "yearId": yearId,

    };
  }


}
