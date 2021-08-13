import 'dart:io';

import 'package:another_flushbar/flushbar.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:push_notifications/views/fcm_token_view.dart';
import 'package:push_notifications/views/porto_view.dart';

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
        // Get the imageUrl (if any) from either the android or apple notification
        String? imageUrl;
        if (Platform.isAndroid) {
          imageUrl = message.notification!.android?.imageUrl;
        } else if (Platform.isIOS) {
          imageUrl = message.notification!.apple?.imageUrl;
        }

        if (message.notification != null) {
          Flushbar(
            title: message.notification!.title,
            message: message.notification!.body,
            icon: (imageUrl != null)
                ? Image(image: NetworkImage(imageUrl))
                : null,
            backgroundColor: Colors.grey,
            duration: Duration(seconds: 4),
            flushbarPosition: FlushbarPosition.TOP,
            onTap: (flushbar) {
              String? routeToPush = _checkRouteToPush(message);
              if (routeToPush != null) {
                Navigator.of(context).pushNamed(routeToPush);
              }
            },
          )..show(context);
        }
      });

      // To handle notifications when the app is in the background
      FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
        String? routeToPush = _checkRouteToPush(message);
        if (routeToPush != null) {
          Navigator.of(context).pushNamed(routeToPush);
        }
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
      String? routeToPush = _checkRouteToPush(initialMessage);
      if (routeToPush != null) {
        Navigator.of(context).pushNamed(routeToPush);
      }
    }
  }

  static String? _checkRouteToPush(RemoteMessage message) {
    if (message.notification != null) {
      switch (message.notification!.title) {
        case "Show my token":
          return FcmTokenView.route;
        case "Show me Porto":
          return PortoView.route;
        default:
          return null;
      }
    }
  }
}
