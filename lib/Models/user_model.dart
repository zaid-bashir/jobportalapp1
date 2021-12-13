class UserModel {
  String id;
  String email;
  String password;
  String name;
  String goal;

  //* User Model Constructor
  UserModel({
     this.id,
     this.email,
     this.password,
     this.name,
     this.goal,
  });

  //* Mengambil data dalam bentuk JSON
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        id : json['id'],
        email : json['email'],
        password : json['password'],
        name : json['name'],
        goal : json['goal']);
    }

  //* Mengembalikan data dalam bentuk JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'password': password,
      'name': name,
      'goal': goal,
    };
  }
}
