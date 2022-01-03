class  Qualification {
  String summary;
  String qualId;
  String qualName;
  String courseId;
  String courseName;
  String streamId;
  String streamName;
  String courseType;
  int instituteId;
  String instituteName;
  int  yearId;
  int  yearName;
  String gradingsystemId;
  String gradingsystemName;
  String value;


  Qualification({this.summary,this.qualId,this.qualName,this.streamId,this.streamName,this.courseType,
    this.instituteId,this.instituteName, this.yearId,this.yearName,this.gradingsystemId,this.gradingsystemName,this.value,this.courseId,
    this.courseName});


  factory Qualification.fromJson(Map<String, dynamic> item) {
    return Qualification(
        summary: item["summary"],
        qualId: item["qualId"],
        qualName: item["qualName"],
        streamId: item["streamId"],
        streamName: item["streamName"],
        courseType: item["courseType"],
        instituteId: item["instituteId"],
        instituteName: item["instituteName"],
        yearId: item["yearId"],
        yearName: item["yearName"],
        gradingsystemId: item["gradingsystemId"],
        gradingsystemName: item["gradingsystemName"],
        value: item["value"],
        courseId: item["courseId"],
        courseName: item["courseName"]);
  }

  Map<String, dynamic> toJson() {
    return {
      "summary": summary,
      "qualificationId": qualId,
      "qualificationName": qualName,
      "streamId": streamId,
      "streamName": streamName,
      "courseType": courseType,
      "instituteId": instituteId,
      "instituteName": instituteName,
      "yearId": yearId,
      "yearName": yearName,
      "gradingsystemId": gradingsystemId,
      "gradingsystemName": gradingsystemName,
      "value": value,
      "courseName": courseName,
      "courseId" : courseId
    };
  }

}