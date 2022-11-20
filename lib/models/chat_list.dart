class ChatList {
  List<ParticipantsData>? participantsData;
  bool? isAdminChat;
  List<String>? participants;

  ChatList({this.participantsData, this.isAdminChat, this.participants});

  ChatList.fromJson(Map<String, dynamic> json) {
    if (json['participantsData'] != null) {
      participantsData = <ParticipantsData>[];
      json['participantsData'].forEach((v) {
        participantsData!.add(ParticipantsData.fromJson(v));
      });
    }
    isAdminChat = json['isAdminChat'];
    participants = json['participants'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (participantsData != null) {
      data['participantsData'] =
          participantsData!.map((v) => v.toJson()).toList();
    }
    data['isAdminChat'] = isAdminChat;
    data['participants'] = participants;
    return data;
  }
}

class ParticipantsData {
  String? uid;
  String? role;
  String? name;
  String? email;
  String? token;

  ParticipantsData({this.uid, this.role, this.name, this.email, this.token});

  ParticipantsData.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    role = json['role'];
    name = json['name'];
    email = json['email'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['uid'] = uid;
    data['role'] = role;
    data['name'] = name;
    data['email'] = email;
    data['token'] = token;
    return data;
  }
}
