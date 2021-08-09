import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class NotificationsService {
  static void registerNotificationService(BuildContext context) async {
    // Get user permissions
    NotificationSettings settings =
        await FirebaseMessaging.instance.requestPermission(
      alert: true,
      badge: true,
      provisional: false,
      sound: true,
    );

    // If user has granted permission, handle notifications
    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      // To handle notifications when the app is on the foreground
      FirebaseMessaging.onMessage.listen((RemoteMessage message) {
        Navigator.of(context).pushNamed('/portoRoute');
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(
                'Received a Notification: ${message.notification!.title}')));
      });

      // To handle notifications when the app is in the background
      FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
        Navigator.of(context).pushNamed('/portoRoute');
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(
                'Received a Notification on background: ${message.notification!.title}')));
      });

      // Handle notification when app was terminated
      await _checkForInitialMessage(context);
    }
  }

  static Future<void> _checkForInitialMessage(BuildContext context) async {
    await Firebase.initializeApp();

    RemoteMessage? initialMessage =
        await FirebaseMessaging.instance.getInitialMessage();

    if (initialMessage != null && initialMessage.notification != null) {
      Navigator.of(context).pushNamed('/fcmKeyRoute');
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
              'Received a Notification when app terminated: ${initialMessage.notification!.title}')));
    }
  }
}
