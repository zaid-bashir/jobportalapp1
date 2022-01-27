class ProfessionalPopulate {
  int candidateexpOrganizationId;
  String OrganizationName;
  String Designation;
  String Experience;
  String StartDate;
  String EndDate;
  String Salary;
  String NoticePeriod;

  ProfessionalPopulate(
      {this.candidateexpOrganizationId,
        this.OrganizationName,
        this.Designation,
        this.Experience,
        this.StartDate,
        this.EndDate,
        this.Salary,
        this.NoticePeriod});

  factory ProfessionalPopulate.fromJson(Map<String, dynamic> item) {
    return ProfessionalPopulate(
      candidateexpOrganizationId: item["candidateexpOrganizationId"],
      OrganizationName: item["OrganizationName"],
      Designation: item["Designation"],
      Experience: item["Experience"],
      StartDate: item["StartDate"],
      EndDate: item["EndDate"],
      Salary: item["Salary"],
      NoticePeriod: item["NoticePeriod"],
    );
  }
}
