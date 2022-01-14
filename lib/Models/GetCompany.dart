
class Company {
  String organizationId;
  String organizationName;

  Company({this.organizationId, this.organizationName});

  Company.fromJson(Map<String, dynamic> json) {
    organizationId = json['organizationId'];
    organizationName = json['organizationName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['organizationId'] = this.organizationId;
    data['organizationName'] = this.organizationName;
    return data;
  }
}
