enum Role { user, admin }

class UserModel {
  String? uid;
  String? email;
  String? name;
  Role? role;
  String? token;

  UserModel({
    this.uid,
    this.email,
    this.name,
    this.role,
    this.token,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    email = json['email'];
    name = json['name'];
    role = json['role'] != null ? Role.values.byName(json['role']) : null;
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['uid'] = uid;
    data['email'] = email;
    data['name'] = name;
    data['role'] = role?.name;
    data['token'] = token;
    return data;
  }

  bool isAdmin() => role == Role.admin;
}
