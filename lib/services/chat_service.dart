import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:i_am_volunteer/services/locator.dart';

import '../models/chat_item.dart';
import 'firestore_service.dart';

class ChatService {
  final _db = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  final firestoreService = locator.get<FirestoreService>();

  Stream<List<ChatItem>> chatStreams() async* {
    List<String> adminUids = await firestoreService.getAdminUids();
    final uid = _auth.currentUser!.uid;
    adminUids.add(uid);
    final query = await _db
        .collection('chats')
        .where('participants', arrayContainsAny: adminUids)
        .get();
    final ref = query.docs.first.reference;
    yield* ref
        .collection('messages')
        .orderBy('time', descending: true)
        .snapshots()
        .map((event) {
      return event.docs.map((e) {
        return ChatItem.fromJson(e.data());
      }).toList();
    });
  }

  Future<void> sendChat(String message) async {
    List<String> adminUids = await firestoreService.getAdminUids();
    final currentUid = _auth.currentUser!.uid;
    adminUids.addIf(!adminUids.contains(currentUid), currentUid);
    final ref = await _db
        .collection('chats')
        .where('participants', arrayContainsAny: adminUids)
        .get();
    if (ref.docs.isNotEmpty) {
      final doc = ref.docs.first;
      await doc.reference.collection('messages').add({
        'sentBy': currentUid,
        'message': message,
        'time': FieldValue.serverTimestamp(),
      });
    } else {
      log('Chat not found!');
    }
    // doc.reference
  }

  Future<bool> chatExists() async {
    List<String> adminUids = await firestoreService.getAdminUids();
    final uid = _auth.currentUser!.uid;
    adminUids.addIf(!adminUids.contains(uid), uid);
    final query = await _db
        .collection('chats')
        .where('participants', arrayContainsAny: adminUids)
        .get();
    log('SIZE: ${query.size}');
    return query.size > 0;
  }

  Future<void> createChat() async {
    List<String> adminUids = await firestoreService.getAdminUids();
    final uid = _auth.currentUser!.uid;
    adminUids.addIf(!adminUids.contains(uid), uid);
    await _db.collection('chats').add({
      'participants': adminUids,
    });
  }
}
