import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/user_model.dart';
import '../utils/ui_utils.dart';
import 'locator.dart';
import 'messaging_service.dart';

class FirestoreService {
  final _db = FirebaseFirestore.instance;
  final _messaging = locator<MessagingService>();

  Future<bool> saveUserData(UserModel user) async {
    try {
      await _db.collection('users').doc(user.uid).set(user.toJson());
      return true;
    } catch (e) {
      log('ERROR: $e');
      UiUtils.showPendingToast('Unknown error, please try again!');
      return false;
    }
  }

  Future<UserModel?> getUserData(String uid) async {
    try {
      final userDoc = await _db.collection('users').doc(uid).get();
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

  Future<void> updateToken(String uid) async {
    final token = await _messaging.getToken();
    await _db.collection('users').doc(uid).update({
      'token': token,
    });
  }

  Future<List<String>> getAdminUids() async {
    final docs = await _db
        .collection('users')
        .where('role', isEqualTo: Role.admin.name)
        .get();
    List<String> uids = List.generate(docs.size, (index) {
      final user = UserModel.fromJson(docs.docs[index].data());
      return user.uid!;
    });
    return uids;
  }

  Future<UserModel> getUserByUid(String uid) async {
    final userDoc = await _db.collection('users').doc(uid).get();
    final user = UserModel.fromJson(userDoc.data()!);
    return user;
  }

  Future<String> getNameById(String uid) async {
    final userDoc = await _db.collection('users').doc(uid).get();
    final user = UserModel.fromJson(userDoc.data()!);
    return user.name!;
  }
}
