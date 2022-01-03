
class Company {
  String companyId;
  String companyName;

  Company({this.companyId, this.companyName});

  Company.fromJson(Map<String, dynamic> json) {
    companyId = json['companyId'];
    companyName = json['companyName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['companyId'] = this.companyId;
    data['companyName'] = this.companyName;
    return data;
  }
}
