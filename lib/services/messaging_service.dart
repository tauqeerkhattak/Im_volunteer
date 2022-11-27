import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:i_am_volunteer/services/locator.dart';

import '../main.dart';
import 'notification_service.dart';

class MessagingService {
  final _instance = FirebaseMessaging.instance;
  final notificationService = locator<NotificationService>();

  Future<String?> getToken() async {
    await _instance.deleteToken();
    return await _instance.getToken();
  }

  Future<void> deleteToken() async {
    await _instance.deleteToken();
  }

  Future<void> initMessaging() async {
    final token = FirebaseMessaging.instance.getToken();
    log('Init Messaging token: $token');
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      log('Message Received!');
      log('Notification received on foreground: ${message.notification?.title}!');
      if (message.notification != null) {
        notificationService.showNotification(
          message.notification!.title ?? 'New notification!',
          message.notification!.body ??
              'Tap to open the app to see what\'s new',
        );
      } else {
        log('Notification is null!');
      }
    });
    FirebaseMessaging.onBackgroundMessage(
      onBackgroundMessage,
    );
  }
}
