import 'dart:developer';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService {
  final _notificationPlugin = FlutterLocalNotificationsPlugin();
  final androidNotificationDetails = const AndroidNotificationDetails(
    'i_am_volunteer_channel_id',
    'i_am_volunteer_channel',
    channelDescription: 'This is a channel for IAmVolunteer App',
    importance: Importance.max,
    priority: Priority.max,
    ticker: 'ticker',
  );

  Future<void> initNotifications() async {
    const androidSettings = AndroidInitializationSettings('app_icon');
    final DarwinInitializationSettings initializationSettingsDarwin =
        DarwinInitializationSettings(
            onDidReceiveLocalNotification: onDidReceiveLocalNotification);
    final InitializationSettings initializationSettings =
        InitializationSettings(
      android: androidSettings,
      iOS: initializationSettingsDarwin,
    );
    await _notificationPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: onDidReceiveNotificationResponse,
    );
  }

  void onDidReceiveNotificationResponse(
      NotificationResponse notificationResponse) async {
    final String? payload = notificationResponse.payload;
    log('Notification Recieved!');
    if (notificationResponse.payload != null) {
      log('notification payload: $payload');
    }
  }

  void onDidReceiveLocalNotification(int id, String? a, String? b, String? c) {
    log('Notification Received!');
  }

  Future<void> showNotification(String title, String body) async {
    final notificationDetails = NotificationDetails(
      android: androidNotificationDetails,
    );
    await _notificationPlugin.show(
      0,
      title,
      body,
      notificationDetails,
    );
  }
}
