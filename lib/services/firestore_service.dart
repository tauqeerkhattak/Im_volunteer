import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/user_model.dart';
import '../utils/ui_utils.dart';

class FirestoreService {
  final _db = FirebaseFirestore.instance;

  Future<bool> saveUserData(UserModel user) async {
    try {
      await _db.collection('Users').doc(user.uid).set(user.toJson());
      return true;
    } catch (e) {
      log('ERROR: $e');
      UiUtils.showPendingToast('Unknown error, please try again!');
      return false;
    }
  }

  Future<UserModel?> getUserData(String uid) async {
    try {
      final userDoc = await _db.collection('Users').doc(uid).get();
      if (userDoc.data() != null) {
        UserModel user = UserModel.fromJson(userDoc.data()!);
        return user;
      }
      throw Exception();
    } catch (e) {
      log('ERROR: $e');
      UiUtils.showPendingToast('Unknown error, please try again!');
      return null;
    }
  }
}
