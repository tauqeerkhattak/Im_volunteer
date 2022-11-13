import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class ChatItem extends Equatable {
  String? message;
  String? sentBy;
  DateTime? time;

  ChatItem({this.message, this.sentBy, this.time});

  ChatItem.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    sentBy = json['sentBy'];
    time = json['time'] != null ? (json['time'] as Timestamp).toDate() : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['sentBy'] = sentBy;
    data['time'] = time;
    return data;
  }

  @override
  List<Object?> get props => [message, sentBy, time];
}
