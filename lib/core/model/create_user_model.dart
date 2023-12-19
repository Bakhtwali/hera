class CreateUserModel {
  String? id;
  String? name;
  String? email;
  String? password;
  String? confirmPassword;
  DateTime? createat;
  bool? isUserBlocked;

  CreateUserModel({
    this.id,
    this.name,
    this.email,
    this.password,
    this.confirmPassword,
    this.createat,
    this.isUserBlocked,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['password'] = password;
    data['confirmPassword'] = confirmPassword;
    data['createat'] = createat;
    data['isUserBlocked'] = isUserBlocked;
    return data;
  }

  CreateUserModel.fromJson(json, id) {
    this.id = id;
    name = json['name'];
    email = json['email'];
    password = json['password'];
    confirmPassword = json['confirmPassword'];
    isUserBlocked = json['isUserBlocked'];
    createat = json['createat'].toDate();
  }
}
