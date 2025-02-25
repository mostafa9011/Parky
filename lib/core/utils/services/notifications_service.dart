import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService {
  static final FirebaseMessaging _firebaseMessaging =
      FirebaseMessaging.instance;
  static final FlutterLocalNotificationsPlugin _localNotifications =
      FlutterLocalNotificationsPlugin();

  // initialize
  static Future<void> initialize() async {
    // request permission
    NotificationSettings settings =
        await _firebaseMessaging.requestPermission();
    if (settings.authorizationStatus == AuthorizationStatus.denied) {
      log("authorizationStatus is denied");
      return;
    }

    // initialize local notifications
    const AndroidInitializationSettings androidInitSettings =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    const InitializationSettings initSettings =
        InitializationSettings(android: androidInitSettings);
    await _localNotifications.initialize(initSettings);

    // listen to messages
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      log("new message : ${message.notification?.title}");
      _showNotification(message);
    });

    // get token
    String? token = await _firebaseMessaging.getToken();
    log("🔑 FCM Token: $token");
  }

  // show notification
  static Future<void> _showNotification(RemoteMessage message) async {
    const AndroidNotificationDetails androidDetails =
        AndroidNotificationDetails(
      'channel_id',
      'channel_name',
      importance: Importance.high,
      priority: Priority.high,
    );

    const NotificationDetails notificationDetails =
        NotificationDetails(android: androidDetails);
    await _localNotifications.show(
      0, // ID
      message.notification?.title ?? "empty title",
      message.notification?.body ?? "empty body",
      notificationDetails,
    );
  }
}
