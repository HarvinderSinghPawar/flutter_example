import 'dart:async';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class AppFirebaseMessagingService {
  static final AppFirebaseMessagingService _instance = AppFirebaseMessagingService._internal();

  factory AppFirebaseMessagingService() {
    return _instance;
  }

  AppFirebaseMessagingService._internal();

  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  void initialize() {
    _requestPermissions();
    _configureLocalNotification();
    _configureFirebaseMessaging();
  }

  void _requestPermissions() {
    _firebaseMessaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );
  }

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    Timer.periodic(oneSec, (Timer timer) {
      final int remainingTime = 60 - timer.tick; // Example for a 1-minute timer
      if (remainingTime <= 0) {
        timer.cancel();
        showNotification('00:00');
      } else {
        final minutes = remainingTime ~/ 60;
        final seconds = remainingTime % 60;
        final timeString = '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
        showNotification(timeString);
      }
    });
  }

  void _configureLocalNotification() {
    const AndroidInitializationSettings initializationSettingsAndroid = AndroidInitializationSettings('@mipmap/ic_launcher');
    final DarwinInitializationSettings initializationSettingsIOS = DarwinInitializationSettings(
      onDidReceiveLocalNotification: (id, title, body, payload) async {},
    );
    final InitializationSettings initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
    );
    _flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  void _configureFirebaseMessaging() {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      _showNotificationFirebase(message);
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      // Handle the message when the app is opened from a notification
    });
  }

  Future<void> showNotification(String time) async {
    const androidPlatformChannelSpecifics = AndroidNotificationDetails(
      'your_channel_id',
      'your_channel_name',
      importance: Importance.low,  // Set to low to avoid popup
      priority: Priority.low,  // Set to low to avoid popup
      ticker: 'ticker',
      ongoing: true,  // This makes the notification ongoing
      onlyAlertOnce: true,  // Ensure it only alerts once
    );
    const platformChannelSpecifics = NotificationDetails(android: androidPlatformChannelSpecifics);
    await _flutterLocalNotificationsPlugin.show(
      0,  // Use the same ID to update the existing notification
      'Timer',
      time,
      platformChannelSpecifics,
      payload: 'item x',
    );
  }


  Future<void> _showNotificationFirebase(RemoteMessage message) async {
    const AndroidNotificationDetails androidPlatformChannelSpecifics = AndroidNotificationDetails(
      'your_channel_id', 'your_channel_name',
      importance: Importance.max,
      priority: Priority.high,
      ticker: 'ticker',
    );
    const NotificationDetails platformChannelSpecifics = NotificationDetails(android: androidPlatformChannelSpecifics);
    await _flutterLocalNotificationsPlugin.show(
      0,
      message.notification?.title,
      message.notification?.body,
      platformChannelSpecifics,
      payload: 'item x',
    );
  }

  Future<String?> getToken() async {
    return await _firebaseMessaging.getToken();
  }
}
