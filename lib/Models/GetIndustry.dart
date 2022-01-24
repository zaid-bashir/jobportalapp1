
class Industry {
  String industryId;
  String industryName;

  Industry({this.industryId, this.industryName});

  Industry.fromJson(Map<String, dynamic> json) {
    industryId = json['industryId'];
    industryName = json['industryName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['industryId'] = this.industryId;
    data['industryName'] = this.industryName;
    return data;
  }
}
