import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import '../main.dart';

class InitialView extends StatefulWidget {
  const InitialView({Key? key}) : super(key: key);

  @override
  _InitialViewState createState() => _InitialViewState();
}

class _InitialViewState extends State<InitialView> {
  late final FirebaseMessaging _messaging;

  void registerNotification() async {
    // Initialize Firebase app
    await Firebase.initializeApp();

    // Get an instance of FirebaseMessaging
    _messaging = FirebaseMessaging.instance;

    NotificationSettings settings = await _messaging.requestPermission(
      alert: true,
      badge: true,
      provisional: false,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print('User granted permission');

      // To handle notifications when the app is on the foreground
      FirebaseMessaging.onMessage.listen((RemoteMessage message) {
        navigatorKey.currentState!.pushNamed('/portoRoute');
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(
                'Received a Notification: ${message.notification!.title}')));
      });

      // To handle notifications when the app is in the background
      FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
        navigatorKey.currentState!.pushNamed('/portoRoute');
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(
                'Received a Notification on background: ${message.notification!.title}')));
      });

      await checkForInitialMessage();
    } else {
      print('User declined or has not accepted permission');
    }
  }

  Future<void> checkForInitialMessage() async {
    await Firebase.initializeApp();

    RemoteMessage? initialMessage =
        await FirebaseMessaging.instance.getInitialMessage();

    if (initialMessage != null && initialMessage.notification != null) {
      navigatorKey.currentState!.pushNamed('/fcmKeyRoute');
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
              'Received a Notification when app terminated: ${initialMessage.notification!.title}')));
    }
  }

  @override
  void initState() {
    super.initState();
    registerNotification();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/fcmKeyRoute');
                },
                child: Text('FCM Token')),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/portoRoute');
                },
                child: Text('Porto')),
          ],
        ),
      ),
    );
  }
}
