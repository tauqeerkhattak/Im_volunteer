import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:i_am_volunteer/models/user_model.dart';

class CommentModel extends Equatable {
  String? comment;
  String? commentId;
  DateTime? time;
  UserModel? commentBy;
  List<String>? likes;

  CommentModel({
    this.comment,
    this.commentId,
    this.time,
    this.commentBy,
    this.likes,
  });

  CommentModel.fromJson(Map<String, dynamic> json) {
    comment = json['comment'];
    commentId = json['commentId'];
    time = json['time'] != null ? (json['time'] as Timestamp).toDate() : null;
    commentBy = json['commentBy'] != null
        ? UserModel.fromJson(json['commentBy'])
        : null;
    likes = json['likes'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['comment'] = comment;
    data['commentId'] = commentId;
    data['time'] = time;
    data['commentBy'] = commentBy?.toJson();
    data['likes'] = likes;
    return data;
  }

  @override
  List<Object?> get props => [
        comment,
        commentId,
        time,
        likes,
      ];
}
