class Category {
  String reservedId;
  String reservedName;

  Category({this.reservedId, this.reservedName});

 factory  Category.fromJson(Map<String, dynamic> json) {
   return Category(
     reservedId: json["casteId"],
     reservedName: json["casteName"]
   );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['casteId'] = this.reservedId;
    data['casteName'] = this.reservedName;
    return data;
  }
}
