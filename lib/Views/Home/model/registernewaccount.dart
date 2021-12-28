
class RegisterNewAccount {
  int titleId;
  String titleName;
  String firstName;
  String middleName;
  String lastName;
  String email;
  String gender;
  String experience;
  int yearsId;
  String yearsName;
  int monthsId;
  String monthsName;
  int jobCategoryId;
  String jobCategoryName;
  int currentLocationId;
  String currentLocationName;


  RegisterNewAccount({
    this.titleId,
  this.titleName,
    this.firstName,
    this. middleName,
    this.lastName,
    this.email,
    this.gender,
    this.experience,
    this.yearsId,
    this.yearsName,
    this.monthsId,
    this.monthsName,
    this.jobCategoryId,
    this.jobCategoryName,
    this.currentLocationId,
    this.currentLocationName

  });


// changes

  factory RegisterNewAccount .fromJson(Map<String, dynamic> item) {
    return RegisterNewAccount(
        titleId: item["working"],
        titleName: item["  companyId"],
        firstName: item["companyName"],
        middleName: item["  designationId"],
        lastName: item["  designationName"],
        email: item["salary"],
        gender: item["  years"],
        experience: item["industryId"],
        yearsId: item["  industryName"],
        yearsName: item["  compId"],
        jobCategoryId: item["  compName"],
        jobCategoryName: item["designId"],
        currentLocationId: item["  designName"],
        currentLocationName: item["sal"]

    );
  }

  Map<String, dynamic> toJson() {
    return {
      "titleId": titleId,
      "titleName": titleName,

      "firstName" :firstName,
      "middleName":middleName,
      "lastName":lastName,
      "email":email,
      "gender":gender,
      "experience":experience,
      "yearsId":yearsId,
      "yearsName":yearsName,
      "monthsId":monthsId,
      "monthsName":monthsName,
      "monthsName":jobCategoryId,
      "jobCategoryName":jobCategoryName,
      "currentLocationId":currentLocationId,
      "currentLocationName":currentLocationName
    };
  }

}