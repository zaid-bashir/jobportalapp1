class ProfessionalPopulate {
  String candidateexpUuid;
  int candidateexpOrganizationId;
  String candidateexpIscurrentcompany;
  String OrganizationName;
  String Designation;
  String StartDate;
  String EndDate;
  String Salary;
  String NoticePeriod;

  ProfessionalPopulate(
      {this.candidateexpUuid,
        this.candidateexpOrganizationId,
        this.candidateexpIscurrentcompany,
        this.OrganizationName,
        this.Designation,
        this.StartDate,
        this.EndDate,
        this.Salary,
        this.NoticePeriod});

  factory ProfessionalPopulate.fromJson(Map<String, dynamic> item) {
    return ProfessionalPopulate(
      candidateexpOrganizationId: item["candidateexpOrganizationId"],
      candidateexpUuid: item["candidateexpUuid"],
      candidateexpIscurrentcompany: item["candidateexpIscurrentcompany"],
      OrganizationName: item["OrganizationName"],
      Designation: item["Designation"],
      StartDate: item["StartDate"],
      EndDate: item["EndDate"],
      Salary: item["Salary"],
      NoticePeriod: item["NoticePeriod"],
    );
  }
}
