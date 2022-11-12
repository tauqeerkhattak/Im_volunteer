import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:i_am_volunteer/services/auth_service.dart';
import 'package:i_am_volunteer/services/locator.dart';

class ChatService {
  final _db = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;

  Stream chatStreams () {
    final uid = _auth.currentUser!.uid;
    final query = _db.collection('chats').where('participants',arrayContains: uid).snapshots();
    return query;
  }

  Future <void> sendChat(String uid) async {
    final currentUid = _auth.currentUser!.uid;
    final ref = await _db.collection('chats').where('participants',arrayContains: [uid,currentUid]).get();
    final doc = ref.docs.first;
    doc.reference
  }
}
