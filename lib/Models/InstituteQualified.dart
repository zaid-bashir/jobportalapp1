
class Institute {
  String instituteId;
  String instituteName;

  Institute({this.instituteId, this.instituteName});

  factory Institute.fromJson(Map<String, dynamic> json) {
    return Institute(instituteId: json["instituteId"], instituteName: json["instituteName"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['instituteId'] = this.instituteId;
    data['instituteName'] = this.instituteName;
    return data;
  }
}
