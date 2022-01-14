// ignore_for_file: unnecessary_this

class JobCategory {
  String jobroleId;
  String jobroleName;

  JobCategory({this.jobroleId, this.jobroleName});

  JobCategory.fromJson(Map<String, dynamic> json) {
    jobroleId = json['jobroleId'];
    jobroleName = json['jobroleName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['jobroleId'] = this.jobroleId;
    data['jobroleName'] = this.jobroleName;
    return data;
  }
}
