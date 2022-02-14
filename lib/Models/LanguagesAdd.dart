class LanguagesAddModel {
  String requestType;
  String candidatelangUuid;
  String candidatelangLanguagename;
  String candidatelangProficiencyId;
  int candidatelangRead;
  int candidatelangWrite;
  int candidatelangSpeak;


  LanguagesAddModel({this.requestType,this.candidatelangUuid,this.candidatelangLanguagename,this.candidatelangProficiencyId,this.candidatelangRead,
  this.candidatelangWrite,this.candidatelangSpeak});

  Map<String, dynamic> toJson() {
    return {
      "requestType": requestType,
      "candidatelangUuid": candidatelangUuid,
      "candidatelangLanguagename": candidatelangLanguagename,
      "candidatelangProficiencyId": candidatelangProficiencyId,
      "candidatelangRead": candidatelangRead,
      "candidatelangWrite": candidatelangWrite,
      "candidatelangSpeak": candidatelangSpeak
    };
  }
}
