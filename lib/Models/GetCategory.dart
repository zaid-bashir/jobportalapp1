class Category {
  String casteId;
  String casteName;

  Category({this.casteId, this.casteName});

  Category.fromJson(Map<String, dynamic> json) {
    casteId = json['casteId'];
    casteName = json['casteName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['casteId'] = this.casteId;
    data['casteName'] = this.casteName;
    return data;
  }
}
