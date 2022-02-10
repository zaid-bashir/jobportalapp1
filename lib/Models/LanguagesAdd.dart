class LanguagesAdd {
  String requestType;
  String candidatelangLanguagename;
  int candidatelangProficiencyId;
  int candidatelangRead;
  int candidatelanglangWrite;
  int candidatelangSpeak;


  LanguagesAdd({this.requestType,this.candidatelangLanguagename,this.candidatelangProficiencyId,this.candidatelangRead,
  this.candidatelanglangWrite,this.candidatelangSpeak});

  Map<String, dynamic> toJson() {
    return {
      "requestType": requestType,
      "candidatelangLanguagename": candidatelangLanguagename,
      "candidatelangProficiencyId": candidatelangProficiencyId,
      "candidatelangRead": candidatelangRead,
      "candidatelanglangWrite": candidatelanglangWrite,
      "candidatelangSpeak": candidatelangSpeak
    };
  }
}
