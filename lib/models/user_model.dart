enum Role { admin, user }

class UserModel {
  String? cardImage;
  String? dept;
  String? email;
  String? image;
  String? name;
  int? phoneNumber;
  Role? role;
  String? uid;
  String? token;

  UserModel({
    this.cardImage,
    this.dept,
    this.email,
    this.image,
    this.name,
    this.phoneNumber,
    this.role,
    this.uid,
    this.token,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    cardImage = json['cardImage'];
    dept = json['dept'];
    email = json['email'];
    image = json['image'];
    name = json['name'];
    phoneNumber = json['phoneNumber'];
    role = json['role'] != null ? Role.values.byName(json['role']) : null;
    uid = json['uid'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['cardImage'] = cardImage;
    data['dept'] = dept;
    data['email'] = email;
    data['image'] = image;
    data['name'] = name;
    data['phoneNumber'] = phoneNumber;
    data['role'] = role?.name;
    data['uid'] = uid;
    data['token'] = token;
    return data;
  }

  bool isAdmin() => role == Role.admin;
}
