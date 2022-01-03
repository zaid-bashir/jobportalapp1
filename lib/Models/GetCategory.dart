class Category {
  String casteId;
  String casteName;

  Category({this.casteId, this.casteName});

 factory  Category.fromJson(Map<String, dynamic> json) {
   return Category(
     casteId: json["casteId"],
     casteName: json["casteName"]
   );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['casteId'] = this.casteId;
    data['casteName'] = this.casteName;
    return data;
  }
}
