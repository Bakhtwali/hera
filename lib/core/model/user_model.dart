class AppUser {
  String? id;
  String? email;
  String? password;
  String? fname;
  String? lname;
  String? username;
  String? residence;
  String? bio;
  String? sex;
  String? seeking;
 
  String? interested_in;
  String? status;
  String? imageUrl;
  String? phone;
  String? address;
  String? fcmToken;

  AppUser({
    this.id,
    this.email,
    this.password,
    this.fname,
    this.lname,
    this.username,
    this.residence,
    this.bio,
    this.sex,
    this.seeking,
    this.interested_in,
    this.status,
    this.phone,
    this.address,
    this.imageUrl,
    this.fcmToken,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['email'] = email;
    data['fname'] = fname;
    data['Lname'] = lname;
    data['username'] = username;
    data['residence'] = residence;
    data['bio'] = bio;
    data['sex'] = sex;
    data['seeking'] = seeking;
    data['interested_in'] = interested_in;
    data['status'] = status;
    data['phone'] = phone;
    data['address'] = address;
    data['imageUrl'] = imageUrl;
    data['fcmToken'] = fcmToken;

    return data;
  }

  AppUser.fromJson(json, id) {
    this.id = id;
    email = json['email'];
    fname = json['fname'];
    lname = json['lname'];
    username = json['username'];
    residence = json['residence'];
    bio = json['bio'];
    sex = json['sex'];
    seeking = json['seeking'];
    interested_in = json['interested_in'];
    status = json['status'];
    phone = json['phone'];
    address = json['address'];
    imageUrl = json['imageUrl'];
    fcmToken = json['fcmToken'];
  }
}
