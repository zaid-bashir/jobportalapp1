class GetJobList {
  String jobId;
  String companyId;
  String companyName;
  String recruiterId;
  String recruiterName;
  String jobHeadline;
  String jobcategoryName;
  String jobroleName;
  String careerlevelName;

  GetJobList(
      {this.jobId,
      this.companyId,
      this.companyName,
      this.recruiterId,
      this.recruiterName,
      this.jobHeadline,
      this.jobcategoryName,
      this.jobroleName,
      this.careerlevelName});

  factory GetJobList.fromJson(Map<String, dynamic> item) {
    return GetJobList(
      jobId: item["jobId"],
      companyId: item["companyId"],
      companyName: item["companyName"],
      recruiterId: item["recruiterId"],
      recruiterName: item["recruiterName"],
      jobHeadline: item["jobHeadline"],
      jobcategoryName: item["jobcategoryName"],
      jobroleName: item["jobroleName"],
      careerlevelName: item["careerlevelName"],
    );
  }
}
