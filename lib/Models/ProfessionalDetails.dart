class Professional {
  String working;
  int  companyId;
  String companyName;
  int designationId;
  String designationName;
  String salary;
  String years;
  String months;
  int industryId;
  String industryName;
  int compId;
  String compName;
  int designId;
  String designName;
  String sal;
  String tenureYears;
  String tenureMonths;

// changes
  Professional(
      {this.working,
      this.companyId,
      this.companyName,
      this.designationId,
      this.designationName,
      this.salary,
      this.years,
      this.months,
      this.industryId,
      this.industryName,
      this.compId,
      this.compName,
      this.designId,
      this.designName,
      this.sal,
      this.tenureYears,
      this.tenureMonths});

  factory Professional.fromJson(Map<String, dynamic> item) {
    return Professional(
      working: item["working"],
      companyId: item["  companyId"],
      companyName: item["companyName"],
      designationId: item["  designationId"],
      designationName: item["  designationName"],
      salary: item["salary"],
      years: item["  years"],
      industryId: item["industryId"],
      industryName: item["  industryName"],
      compId: item["  compId"],
      compName: item["  compName"],
      designId: item["designId"],
      designName: item["  designName"],
      sal: item["sal"],
      tenureMonths: item["  tenureMonths"],
      tenureYears: item["  tenureYears"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "working": working,
      "companyId": companyId,
      "companyName": companyName,
      "designationId": designationId,
      "designationName": designationName,
      "years": years,
      "industryId": industryId,
      "industryName": industryName,
      "compId": compId,
      "compName": compName,
      "designId": designId,
      "designName": designName,
      "tenureYears": tenureYears,
      "tenureMonths": tenureMonths,
    };
  }
}
