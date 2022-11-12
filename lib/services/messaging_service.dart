import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';

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
    FirebaseMessaging.onBackgroundMessage(_onBackgroundMessage);
  }

  Future<void> _onBackgroundMessage(RemoteMessage remoteMessage) async {
    log('Background Notification received: ${remoteMessage.notification?.title}!');
  }
}
