
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
    int titleId,
    String titleName,
    String firstName,
    String middleName,
    String lastName,
    String email,
    String gender,
    String experience,
    int yearsId,
    String yearsName,
    int monthsId,
    String monthsName,
    int jobCategoryId,
    String jobCategoryName,
    int currentLocationId,
    String currentLocationName

  });


// changes
  RegisterNewAccount({this.titleId, this.titleName});

  RegisterNewAccount .add({this.titleName});

  factory RegisterNewAccount .fromJson(Map<String, dynamic> item) {
    return RegisterNewAccount(
        titleId: item["titleId"], titleName: item["titleName"]);
  }

  Map<String, dynamic> toJson() {
    return {"titleId": titleId,
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