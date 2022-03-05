class ShowDataLogin {
  String candidateEmail;
  String candidateName;
  String token;

  ShowDataLogin({this.candidateEmail, this.candidateName, this.token});

  ShowDataLogin.fromJson(Map<String, dynamic> json) {
    candidateEmail = json['candidateEmail'];
    candidateName = json['candidateName'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['candidateEmail'] = this.candidateEmail;
    data['candidateName'] = this.candidateName;
    data['token'] = this.token;
    return data;
  }
}
