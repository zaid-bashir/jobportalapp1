class Category {
  String reservedId;
  String reservedName;

  Category({this.reservedId, this.reservedName});

 factory  Category.fromJson(Map<String, dynamic> json) {
   return Category(
       reservedId: json["reservedId"],
       reservedName: json["reservedName"]
   );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['reservedId'] = this.reservedId;
    data['reservedName'] = this.reservedName;
    return data;
  }
}
