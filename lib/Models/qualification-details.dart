class Qualification {
  String summary;
  int qualificationId;
  String qualificationName;
  int courseId;
  String courseName;
  int streamId;
  String streamName;
  String courseType;
  int instituteId;
  String instituteName;
  int passingId;
  String passingName;
  int gradingId;
  String gradingName;
  String value;

  Qualification(
      {this.summary,
      this.qualificationId,
      this.qualificationName,
      this.streamId,
      this.streamName,
      this.courseType,
      this.instituteId,
      this.instituteName,
      this.passingId,
      this.passingName,
      this.gradingId,
      this.gradingName,
      this.value,
      this.courseId,
      this.courseName});

  factory Qualification.fromJson(Map<String, dynamic> item) {
    return Qualification(
        summary: item["summary"],
        qualificationId: item["qualificationId"],
        qualificationName: item["qualificationName"],
        streamId: item["streamId"],
        streamName: item["streamName"],
        courseType: item["courseType"],
        instituteId: item["instituteId"],
        instituteName: item["instituteName"],
        passingId: item["passingId"],
        passingName: item["passingName"],
        gradingId: item["gradingId"],
        gradingName: item["gradingName"],-
        value: item["value"],
        courseId: item["courseId"],
        courseName: item["courseName"]);
  }

  Map<String, dynamic> toJson() {
    return {
      "summary": summary,
      "qualificationId": qualificationId,
      "qualificationName": qualificationName,
      "streamId": streamId,
      "streamName": streamName,
      "courseType": courseType,
      "instituteId": instituteId,
      "instituteName": instituteName,
      "passingId": passingId,
      "passingName": passingName,
      "gradingId": gradingId,
      "gradingName": gradingName,
      "value": value,
      "courseName": courseName,
      "courseId": courseId
    };
  }
}
