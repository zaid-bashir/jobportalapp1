class Login {
  String candidateEmail1;
  String candidatePassword;

  Login({this.candidateEmail1, this.candidatePassword});

  Login.fromJson(Map<String, dynamic> json) {
    candidateEmail1 = json['candidateEmail1'];
    candidatePassword = json['candidatePassword'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['candidateEmail1'] = candidateEmail1;
    data['candidatePassword'] = candidatePassword;
    return data;
  }
}
