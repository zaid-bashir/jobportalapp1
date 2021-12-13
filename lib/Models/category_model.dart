class CategoryModel {
  String id;
  String name;
  String imageUrl;
  int createdAt;
  int updatedAt;

  //* Category Model Constructor
  CategoryModel({
     this.id,
     this.name,
     this.imageUrl,
     this.createdAt,
     this.updatedAt,
  });

  //* Mengambil data dalam bentuk JSON
  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json["id"],
      name: json["name"],
      imageUrl: json["imageUrl"],
      createdAt: json["createdAt"],
      updatedAt: json["updatesAt"]
      );
  }

  //* Mengembalikan data dalam bentuk JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'imageUrl': imageUrl,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }
}
