import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';

import '../main.dart';

class MessagingService {
  final _instance = FirebaseMessaging.instance;

  Future<String?> getToken() async {
    await _instance.deleteToken();
    return await _instance.getToken();
  }

  Future<void> deleteToken() async {
    await _instance.deleteToken();
  }

  Future<void> initMessaging() async {
    FirebaseMessaging.onMessage.listen((event) {
      log('Notification received on foreground: ${event.notification?.title}!');
    });
    FirebaseMessaging.onBackgroundMessage(
      onBackgroundMessage,
    );
  }
}
