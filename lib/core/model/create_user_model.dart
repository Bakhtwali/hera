class CreateUserModel {
  String? id;
  String? name;
  String? email;
  String? password;
  String? confirmPassword;
  DateTime? createat;

  CreateUserModel({
    this.id,
    this.name,
    this.email,
    this.password,
    this.confirmPassword,
    this.createat,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['password'] = password;
    data['confirmPassword'] = confirmPassword;
    data['createat'] = createat;
    return data;
  }

  CreateUserModel.fromJson(json, id) {
    this.id = id;
    name = json['name'];
    email = json['email'];
    password = json['password'];
    confirmPassword = json['confirmPassword'];
    createat = json['createat'];
  }
}
